#!/usr/bin/env bash

# Non writable directories are a pain in the ass since xdg-app rm -rf
# can't remove files in them
find /usr -type d -exec chmod u+w {} \;

# Configure fontconfig to look in /app
mkdir -p /app/cache/fontconfig/
mkdir -p /app/etc/fonts/conf.d/
cat >/app/etc/fonts/conf.d/50-flatpak.conf <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
        <cachedir>/usr/cache/fontconfig</cachedir>

        <dir>/app/share/fonts</dir>
        <cachedir>/app/cache/fontconfig</cachedir>

        <include ignore_missing="yes">/app/etc/fonts/local.conf</include>

        <dir>/run/host/fonts</dir>
</fontconfig>
EOF

# Configure ld.so to look in /app
mkdir -p /app/etc/ld.so.conf.d/
echo "/app/lib64" > /app/etc/ld.so.conf.d/app.conf
/sbin/ldconfig

