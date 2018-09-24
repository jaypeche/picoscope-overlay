# picoscope-overlay
PicoScope v6+ [Gentoo Linux](https://www.gentoo.org/get-started/about/) overlay
[Distributed by Pico Technology 2018 Ltd](https://www.picotech.com/)

## Install overlay :

Since version 2.2.16, Portage has a native mechanism for adding overlays.

* Just copy picoscope-overlay.conf to your /etc/portage/repos.conf directory:

root # mkdir -p /etc/portage/repos.conf
root # wget -c https://raw.githubusercontent.com/jaypeche/picoscope-overlay/master/picoscope-overlay.conf -O /etc/portage/repos.conf/picoscope-overlay.conf

* Edit the "path" variable in /etc/portage/repos.conf/picoscope-overlay.conf to suit your overlay storage path
(for example, /usr/local/portage/picoscope-overlay).

## Synchronize repository :

* Now you can sync the overlay using :

root # emaint sync -r picoscope-overlay
