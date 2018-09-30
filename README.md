# picoscope-overlay
PicoScope v6+ [Gentoo Linux](https://www.gentoo.org/get-started/about/) overlay
[Distributed by Pico Technology 2018 Ltd](https://www.picotech.com/)

## Import overlay :

Since version 2.2.16, Portage has a native mechanism for adding overlays.

* Just copy picoscope-overlay.conf to your /etc/portage/repos.conf directory:

```
root # mkdir -p /etc/portage/repos.conf 
root # wget -c https://raw.githubusercontent.com/jaypeche/picoscope-overlay/master/picoscope-overlay.conf -O /etc/portage/repos.conf/picoscope-overlay.conf
```

* Edit the "location" variable in /etc/portage/repos.conf/picoscope-overlay.conf to suit your overlay storage path
(for example, /usr/local/portage/picoscope-overlay).

## Synchronize repository :

* Now you can sync the overlay using :

```
root # emaint sync -r picoscope-overlay
```
## Install PicoScope software suite :

* Edit /etc/portage/package.keywords/picoscope and add this :

```
>=sci-electronics/picoscope-bin-6.10.1.4.13 ~amd64
>=dev-lang/picomono-4.6.2.16.1.02 ~amd64

# RPM packages Dependencies
# required by sci-electronics/picoscope-bin-6.13.7.4.707::x-portage
# required by picoscope-bin (argument)
=dev-libs/usbdrdaq-2.0.0.1.570 ~amd64
# required by sci-electronics/picoscope-bin-6.13.7.4.707::x-portage
# required by picoscope-bin (argument)
=dev-libs/picoipp-1.3.0.4.21 ~amd64
# required by sci-electronics/picoscope-bin-6.13.7.4.707::x-portage
# required by picoscope-bin (argument)
=dev-libs/usbpt104-1.2.0.1.16 ~amd64
# required by sci-electronics/picoscope-bin-6.13.7.4.707::x-portage
# required by picoscope-bin (argument)
=dev-libs/plcm3-1.2.0.1.08 ~amd64

# UserSpace drivers for 2000a series scope (check config for your own hardware)
=dev-libs/ps2000a-2.1.0.6.570 ~amd64
```

* Edit /etc/portage/package.use/picoscope and select the appropriate driver like this :

```
# Check your oscilloscope hardware specifications (PicoScope 2206A -> ps2000a in this case) :

>=sci-electronics/picoscope-bin-6.13.7.4.707    scope_ps2000a -scope_pl1000 -scope_ps2000 scope_ps3000 -scope_ps3000a -scope_ps4000 -scope_ps4000a \
						-scope_ps5000 -scope_ps5000a scope_ps6000
```

* Now, you can emerge PicoScope software :

```
root # emerge -av picoscope-bin
```


* As mentioned, do not forget to add your user to "pico" group.


```
root # usermod -m -G pico your_user
```


* Now run as user, from your desktop environment in Applications/Electronics/PicoScope menu ...
* Enjoy !
