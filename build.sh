./configure --prefix=/data/local --host=arm-linux-androideabi CFLAGS='-march=armv7-a -mfloat-abi=softfp -DANDROID_CHANGES'
make          PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
make strip    PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
make install  PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" prefix="`pwd`/bin"
cd bin
tar --owner=0 --group=0 -zcf ../dropbear.tar.gz *
