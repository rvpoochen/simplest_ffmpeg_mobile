#!/bin/sh


cd ffmpeg


export INSTALL=thin-ffmpeg
#change the below line to point to the where libx264 is
export X264ROOT=../thin-x264/x86_64
export X264LIB=$X264ROOT/lib
export X264INCLUDE=$X264ROOT/include

export FAACROOT=../thin-faac/x86_64
export FAACLIB=$FAACROOT/lib
export FAACINCLUDE=$FAACROOT/include

export LDFLAGS="-fPIC"


echo "Building x86_64..."

make clean
./configure \
    --extra-cflags='-I$X264INCLUDE -I$FAACINCLUDE' \
    --extra-ldflags='-L$X264LIB -L$FAACLIB' \
    --disable-iconv \
    --disable-asm \
--prefix=../${INSTALL}/x86_64 \
--enable-gpl --enable-nonfree --enable-version3 --disable-vda --disable-bzlib --enable-small \
--enable-libx264 --enable-libfaac --enable-encoder=libx264 --enable-encoder=libfaac \
--disable-ffmpeg --disable-ffprobe --disable-ffplay --disable-ffserver --disable-debug

make
make install
make clean
cd ..