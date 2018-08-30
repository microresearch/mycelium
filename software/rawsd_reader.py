# To read raw files from sd partition for testing

disk = file("/dev/sdb",'rb') # on this laptop. on others might be "/dev/mmcblk0" or similar without the partition

while True: # reads on for ever though
        buf=disk.read(1)
        if not buf: break
        print ord(buf)
