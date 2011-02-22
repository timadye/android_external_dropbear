set -x
./configure --prefix=/data/local --host=arm-linux-androideabi CFLAGS='-march=armv7-a -mfloat-abi=softfp -DANDROID_CHANGES' --disable-utmp --disable-wtmp
make          PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
make strip    PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
cd sftp-server
make
cd ..
tar --owner=0 --group=0 -zcf dropbear.tar.gz dropbear dbclient dropbearkey dropbearconvert scp -C sftp-server sftp-server
