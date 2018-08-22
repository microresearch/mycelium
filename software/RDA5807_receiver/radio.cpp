#include <Arduino.h>
#include <Wire.h>
#include "radio.h"


Radio::Radio() {
}


bool Radio::init() {
	for (int i = 0; i < 16; i ++) {
		regs[i] = 0x0000;
	}

	state.isEnabled    = true;
	state.isMuted      = false;
	state.isSoftMute   = false;
	state.isMonoForced = false;
	state.isBassBoost  = false;
	state.volume       = 5;
	state.sensitivity  = 0;

	Wire.begin();
	Wire.beginTransmission(I2C_INDEX);
	if (Wire.endTransmission()) return false;

	regs[RADIO_REG_2] = R2_SOFT_RESET | R2_ENABLE;
	regs[RADIO_REG_3] = R3_BAND_US_EU | R3_CHAN_SPACE_100K;
	regs[RADIO_REG_4] = 2048;
	regs[RADIO_REG_5] = R5_INTERRUPT_MODE | R5_SNR_THRESHOLD | R5_LNA_PORT | state.volume;
	regs[RADIO_REG_6] = 0x0000;
	regs[RADIO_REG_7] = 0x0000;

	for (char i = RADIO_REG_2; i <= RADIO_REG_7; i ++) {
		sendRegister(i);
	}
	regs[RADIO_REG_2] = R2_AUDIO_OUTPUT | R2_MUTE_DISABLE | R2_RDS_ENABLE | R2_NEW_METHOD | R2_ENABLE;
	sendRegister(RADIO_REG_2);

	regs[RADIO_REG_3] |= R3_TUNE_ENABLE;
	sendRegister(RADIO_REG_3);

	return true;
}


void Radio::setVolume(byte volume) {
	state.volume = volume;
	regs[RADIO_REG_5] = (regs[RADIO_REG_5] & 0xFFF0) | (volume & 0x0F);
	sendRegister(RADIO_REG_5);
}


void Radio::setMute(bool mute) {
	state.isMuted = mute;
	if (mute) {
		regs[RADIO_REG_2] &= (~R2_MUTE_DISABLE);
	} else {
		regs[RADIO_REG_2] |= R2_MUTE_DISABLE;
	}
	sendRegister(RADIO_REG_2);
}


void Radio::setSoftMute(bool softMute) {
	state.isSoftMute = softMute;
	if (softMute) {
		regs[RADIO_REG_4] |= R4_SOFT_MUTE_ENABLE;
	} else {
		regs[RADIO_REG_4] &= (~R4_SOFT_MUTE_ENABLE);
	}
	sendRegister(RADIO_REG_4);
}


void Radio::setForceMono(bool forceMono) {
	state.isMonoForced = forceMono;
	if (forceMono) {
		regs[RADIO_REG_2] |= R2_MONO_SELECT;
	} else {
		regs[RADIO_REG_2] &= (~R2_MONO_SELECT);
	}
	sendRegister(RADIO_REG_2);
}


void Radio::setBassBoost(bool bassBoost) {
	state.isBassBoost = bassBoost;
	if (bassBoost) {
		regs[RADIO_REG_2] |= R2_BASS_BOOST;
	} else {
		regs[RADIO_REG_2] &= (~R2_BASS_BOOST);
	}
	sendRegister(RADIO_REG_2);
}


void Radio::setEnable(bool enable) {
	state.isEnabled = enable;
	if (enable) {
		regs[RADIO_REG_2] |= R2_ENABLE;
	} else {
		regs[RADIO_REG_2] &= (~R2_ENABLE);
	}
	sendRegister(RADIO_REG_2);
}


void Radio::seekUp() {
	resetStation();
	regs[RADIO_REG_2] |= R2_SEEK_UP | R2_SEEK_ENABLE;
	sendRegister(RADIO_REG_2);
}


void Radio::seekDown() {
	resetStation();
	regs[RADIO_REG_2] &= (~R2_SEEK_UP);
	regs[RADIO_REG_2] |= R2_SEEK_ENABLE;
	sendRegister(RADIO_REG_2);
}


/**
 * Tune to the given frequency in MHz.
 */
void Radio::tuneTo(float frequency) {
	unsigned short channelSpacing = regs[RADIO_REG_3] & R3_CHAN_SPACING;
	unsigned short band = regs[RADIO_REG_3] & R3_BAND;

	// Subtract frequency base depending on current band.
	switch (band) {
		case R3_BAND_US_EU:
			frequency -= 87;
			break;
		case R3_BAND_JP:
		case R3_BAND_WORLD:
			frequency -= 76;
			break;
		case R3_BAND_E_EU:
			frequency -= 65;
			break;
	}

	// Find channel number depending on current channel spacing.
	unsigned short channel;
	switch (channelSpacing) {
		case R3_CHAN_SPACE_25K:
			channel = frequency / 0.025f;
			break;
		case R3_CHAN_SPACE_50K:
			channel = frequency / 0.05f;
			break;
		case R3_CHAN_SPACE_100K:
			channel = frequency / 0.1f;
			break;
		case R3_CHAN_SPACE_200K:
			channel = frequency / 0.2f;
			break;
	}

	resetStation();
	regs[RADIO_REG_3] &= (~R3_TUNE_ENABLE);
	sendRegister(RADIO_REG_3);
	regs[RADIO_REG_3] |= ((channel << 6) & R3_CHANNEL) | R3_TUNE_ENABLE;
	sendRegister(RADIO_REG_3);
}


void Radio::resetStation() {
	state.isTuning = true;
	state.isTunedToChannel = false;
	state.hasStationName = false;
	for (byte i = 0; i < 8; i ++) {
		state.stationName[i] = ' ';
	}
}


void Radio::updateStatus() {
	Wire.requestFrom(I2C_SEQ, (6 * 2) );
	for (int i = RADIO_REG_A; i <= RADIO_REG_F; i ++) {
		regs[i] = (Wire.read() << 8) + Wire.read();
	}
	Wire.endTransmission();

	// Toggle RDS enable flag when new data is received to wait for new data.
	if (regs[RADIO_REG_A] & RA_RDS_READY) {
		regs[RADIO_REG_2] &= (~R2_RDS_ENABLE);
		sendRegister(RADIO_REG_2);
		regs[RADIO_REG_2] |= R2_RDS_ENABLE;
		sendRegister(RADIO_REG_2);
	}

	// When tuned disable tuning and stop seeking.
	if (state.isTuning && regs[RADIO_REG_A] & RA_TUNE_COMPLETE) {
		regs[RADIO_REG_3] &= (~R3_TUNE_ENABLE);
		sendRegister(RADIO_REG_3);
		regs[RADIO_REG_2] &= (~R2_SEEK_ENABLE);
		sendRegister(RADIO_REG_2);
	}

	// Transform raw data into radioState.
	state.hasRdsData       = regs[RADIO_REG_A] & RA_RDS_READY;
	state.isTuning         = !(regs[RADIO_REG_A] & RA_TUNE_COMPLETE);
	state.tuningError      = regs[RADIO_REG_A] & RA_SEEK_FAIL;
	state.hasRdsBlockE     = regs[RADIO_REG_A] & RA_RDS_BLK_E;
	state.isStereo         = regs[RADIO_REG_A] & RA_STEREO;
	state.frequency        = getFrequency();
	state.signalStrength   = (regs[RADIO_REG_B] & RB_RSSI) >> 9;
	state.isTunedToChannel = regs[RADIO_REG_B] & RB_IS_STATION;
	if (state.hasRdsData) {
		state.rdsBlockErrors   = regs[RADIO_REG_B] & RB_RDS_ERR;
		if (!(regs[RADIO_REG_B] & RB_RDS_BLOCK_E)) {
			state.rdsBlockA = regs[RADIO_REG_C];
			state.rdsBlockB = regs[RADIO_REG_D];
			state.rdsBlockC = regs[RADIO_REG_E];
			state.rdsBlockD = regs[RADIO_REG_F];

			// if (state.rdsBlockErrors == 0) {
			decodeRdsMessage();
			// }
		} else {
			state.rdsBlockE = regs[RADIO_REG_C];
		}
	}
}


float Radio::getFrequency() {
	unsigned short channelSpacing = regs[RADIO_REG_3] & R3_CHAN_SPACING;
	unsigned short band = regs[RADIO_REG_3] & R3_BAND;
	unsigned short channel = regs[RADIO_REG_A] & RA_CHANNEL;

	// Subtract frequency base depending on current band.
	float freq;
	switch (band) {
		case R3_BAND_US_EU:
			freq = 87.0f;
			break;
		case R3_BAND_JP:
		case R3_BAND_WORLD:
			freq = 76.0f;
			break;
		case R3_BAND_E_EU:
			freq = 65.0f;
			break;
	}

		// Add frequency offset depending on channel spacing.
	switch (channelSpacing) {
		case R3_CHAN_SPACE_25K:
			return freq + (channel * 0.025f);
		case R3_CHAN_SPACE_50K:
			return freq + (channel * 0.05f);
		case R3_CHAN_SPACE_100K:
			return freq + (channel * 0.1f);
		case R3_CHAN_SPACE_200K:
			return freq + (channel * 0.2f);
		default:
			return 0;
	}
}


void Radio::decodeRdsMessage() {
	switch (state.rdsBlockB & RDS_GROUP) {
		case RDS_GROUP_A0:
		case RDS_GROUP_B0:
			byte offset = (state.rdsBlockB & 0x03) << 1;
			char c1 = (char)(state.rdsBlockD >> 8);
			char c2 = (char)(state.rdsBlockD & 0xFF);

			// Copy station name byte only if received it twice in a row...
			if (rdsStationName[offset] == c1) {
				state.stationName[offset] = c1;
				state.hasStationName = true;
			} else {
				rdsStationName[offset] = c1;
			}

			if (rdsStationName[offset + 1] == c2) {
				state.stationName[offset + 1] = c2;
				state.hasStationName = true;
			} else {
				rdsStationName[offset + 1] = c2;
			}

			break;
	}
}


void Radio::sendRegister(byte reg) {
	Wire.beginTransmission(I2C_INDEX);
	Wire.write(reg);
	Wire.write(regs[reg] >> 8);
	Wire.write(regs[reg] & 0xFF);
	Wire.endTransmission();
}
