#!/bin/sh

TARGET=buildroot-prepare
rm -fr $TARGET
mkdir $TARGET
mkdir $TARGET/{var,dev,proc,run,sys,sysroot}
ln -s buildroot/var/opt $TARGET/opt
ln -s buildroot/var/srv $TARGET/srv
ln -s buildroot/var/mnt $TARGET/mnt
ln -s buildroot/var/roothome $TARGET/root
ln -s buildroot/var/home $TARGET/home
ln -s buildroot/run/media $TARGET/media
ln -s buildroot/sysroot/ostree $TARGET/ostree
ln -s buildroot/sysroot/tmp $TARGET/tmp

mv buildroot/usr $TARGET/usr
mv buildroot/etc $TARGET/etc
ln -s var/lib/rpm $TARGET/usr/share/rpm
mv $TARGET/usr/local $TARGET/var/usrlocal

