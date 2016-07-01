#!/bin/sh

TARGET=buildroot-prepare
rm -fr $TARGET
mkdir $TARGET
mkdir $TARGET/{var,dev,proc,run,sys,sysroot}
ln -s ../var/opt $TARGET/opt
ln -s ../var/srv $TARGET/srv
ln -s ../var/mnt $TARGET/mnt
ln -s ../var/roothome $TARGET/root
ln -s ../var/home $TARGET/home
ln -s ../run/media $TARGET/media
ln -s ../sysroot/ostree $TARGET/ostree
ln -s ../sysroot/tmp $TARGET/tmp

mv buildroot/usr $TARGET/usr
mv buildroot/etc $TARGET/etc
ln -s var/lib/rpm $TARGET/usr/share/rpm
cp $TARGET/etc/{passwd,group} $TARGET/usr/lib
for i in passwd group; do
    sed -i -e '/^root:/D' buildroot-prepare/usr/lib/$i
    sed -i -e '/^root:/!D' buildroot-prepare/etc/$i
done
mv $TARGET/usr/local $TARGET/var/usrlocal

