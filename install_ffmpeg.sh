#!/bin/sh
sudo echo &&
wget http://ffmpeg.org/releases/ffmpeg-4.0.2.tar.xz&&
tar -xf ffmpeg-4.0.2.tar.xz &&
cd ffmpeg-4.0.2 &&
sudo apt-get install libavdevice-dev libavresample-dev libass-dev libfdk-aac-dev libfreetype6-dev libmp3lame-dev libopus-dev libtheora-dev libvorbis-dev libvpx-dev libx264-dev libx265-dev -y  &&
sed -i 's/-lflite"/-lflite -lasound"/' configure &&
./configure --prefix=/usr/local  \
            --enable-gpl         \
            --enable-version3    \
            --enable-nonfree     \
            --disable-static     \
            --enable-shared      \
            --disable-debug      \
            --enable-avresample  \
            --enable-libass      \
            --enable-libfdk-aac  \
            --enable-libfreetype \
            --enable-libmp3lame  \
            --enable-libopus     \
            --enable-libtheora   \
            --enable-libvorbis   \
            --enable-libvpx      \
            --enable-libx264     \
            --enable-libx265     \
            --docdir=/usr/share/doc/ffmpeg-4.0.2 &&
make -j4 &&
gcc tools/qt-faststart.c -o tools/qt-faststart &&
sudo make install &&
sudo install -v -m755    tools/qt-faststart /usr/bin &&
sudo install -v -m755 -d           /usr/share/doc/ffmpeg-4.0.2 &&
sudo install -v -m644    doc/*.txt /usr/share/doc/ffmpeg-4.0.2 &&
cd ..&&
sudo rm -R ffmpeg-4.0.2 &&
sudo rm ffmpeg-4.0.2.tar.xz &&
sudo ldconfig
