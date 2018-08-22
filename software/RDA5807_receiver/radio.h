#include <Arduino.h>

#define I2C_SEQ   0x10
#define I2C_INDEX 0x11

#define RADIO_REG_2 0x02
#define RADIO_REG_3 0x03
#define RADIO_REG_4 0x04
#define RADIO_REG_5 0x05
#define RADIO_REG_6 0x06
#define RADIO_REG_7 0x07

#define RADIO_REG_A 0x0A
#define RADIO_REG_B 0x0B
#define RADIO_REG_C 0x0C
#define RADIO_REG_D 0x0D
#define RADIO_REG_E 0x0E
#define RADIO_REG_F 0x0F

// Register 2 bits
#define R2_AUDIO_OUTPUT   0x8000
#define R2_MUTE_DISABLE   0x4000
#define R2_MONO_SELECT    0x2000
#define R2_BASS_BOOST     0x1000
#define R2_CLOCK_CAL      0x0800
#define R2_RCLK_DIRECT    0x0400
#define R2_SEEK_UP        0x0200
#define R2_SEEK_ENABLE    0x0100
#define R2_SEEK_NO_WRAP   0x0080
#define R2_CLOCK_MODE     0x0070
#define R2_CLOCK_MODE_32K 0x0000
#define R2_CLOCK_MODE_12M 0x0010
#define R2_CLOCK_MODE_13M 0x0020
#define R2_CLOCK_MODE_19M 0X0030
#define R2_CLOCK_MODE_24M 0X0050
#define R2_CLOCK_MODE_26M 0x0060
#define R2_CLOCK_MODE_38M 0x0070
#define R2_RDS_ENABLE     0x0008
#define R2_NEW_METHOD     0x0004
#define R2_SOFT_RESET     0x0002
#define R2_ENABLE         0x0001

// Register 3 bits
#define R3_CHANNEL         0xFFC0
#define R3_DIRECT_MODE     0x0020
#define R3_TUNE_ENABLE     0x0010
#define R3_BAND            0x000C
#define R3_BAND_US_EU      0x0000
#define R3_BAND_JP         0x0004
#define R3_BAND_WORLD      0x0008
#define R3_BAND_E_EU       0x000C
#define R3_CHAN_SPACING    0x0003
#define R3_CHAN_SPACE_100K 0x0000
#define R3_CHAN_SPACE_200K 0x0001
#define R3_CHAN_SPACE_50K  0x0002
#define R3_CHAN_SPACE_25K  0x0003

// Register 4 bits
#define R4_SEEK_TUNE_IE     0x4000
#define R4_DE_EMPHASIS_50   0x0800
#define R4_SOFT_MUTE_ENABLE 0x0200
#define R4_AFC_DISABLE      0x0100
#define R4_I2S_ENABLE       0x0040
#define R4_GPIO3            0x0030
#define R4_GPIO2            0x000C
#define R4_GPIO1            0x0003

// Register 5 bits
#define R5_INTERRUPT_MODE 0x8000
#define R5_SNR_THRESHOLD  0x0800
#define R5_LNA_PORT       0x0080
#define R5_VOLUME         0x000F

#define RA_RDS_READY     0x8000
#define RA_TUNE_COMPLETE 0x4000
#define RA_SEEK_FAIL     0x2000
#define RA_RDS_SYNC      0x1000
#define RA_RDS_BLK_E     0x0800
#define RA_STEREO        0x0400
#define RA_CHANNEL       0x03FF

#define RB_RSSI        0xFE00
#define RB_IS_STATION  0x0100
#define RB_RDS_BLOCK_E 0x0010
#define RB_RDS_ERR     0x000F

#define RDS_GROUP     0xF800
#define RDS_GROUP_A0  0x0000
#define RDS_GROUP_A2  0x2000
#define RDS_GROUP_A4  0x4000
#define RDS_GROUP_A10 0xA000
#define RDS_GROUP_B0  0x0800


class Radio {
	public:
		struct RadioState {
			bool isEnabled;
			bool isMuted;
			bool isSoftMute;
			bool isMonoForced;
			bool isBassBoost;
			byte volume;
			byte sensitivity;

			bool isTuning;
			bool tuningComplete;
			bool tuningError;
			bool isTunedToChannel;
			bool isStereo;
			float frequency;
			byte signalStrength;

			bool hasRdsData;
			bool hasRdsBlockE;
			byte rdsBlockErrors;
			unsigned short rdsBlockA;
			unsigned short rdsBlockB;
			unsigned short rdsBlockC;
			unsigned short rdsBlockD;
			unsigned short rdsBlockE;

			bool hasStationName;
			char stationName[9];
		} radioState;
		RadioState state;

		Radio();
		bool init();
		void setVolume(byte volume);
		void setMute(bool mute);
		void setSoftMute(bool softMute);
		void setForceMono(bool forceMono);
		void setBassBoost(bool bassBoost);
		void setEnable(bool enable);
		void seekUp();
		void seekDown();
		void tuneTo(float frequency);
		void updateStatus();


	private:
		unsigned short regs[16];
		char rdsStationName[8];

		float getFrequency();
		void resetStation();
		void sendRegister(byte reg);
		void decodeRdsMessage();
};


