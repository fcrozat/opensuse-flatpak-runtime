# flatpak-runtime

A [openSUSE](http://opensuse.org) Leap based runtime for [Flatpak](http://www.flatpak.org).


## Create runtime

On openSUSE 42.1
```
$ zypper install -y git make sudo
$ zypper addrepo -f http://download.opensuse.org/repositories/Virtualization:/Appliances:/Builder/openSUSE_Leap_42.1/Virtualization:Appliances:Builder.repo
$ zypper --no-gpg-checks install -y python3-kiwi
$ zypper addrepo -f http://download.opensuse.org/repositories/home:fcrozat:branches:openSUSE:Leap:42.1:Update/standard/home:fcrozat:branches:openSUSE:Leap:42.1:Update.repo
$ zypper --no-gpg-checks install -y flatpak
$ git clone https://github.com/fcrozat/opensuse-flatpak-runtime.git
$ cd opensuse-flatpak-runtime
$ make
```


The scripts are based on the one from [centos-flatpak-runtime](https://github.com/matthiasclasen/flatpak-runtime).
