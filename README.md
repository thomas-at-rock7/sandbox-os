# RockREMOTE Sandbox OS

This is a duplication to the RockREMOTE OS with most of its utilities.

## Setting up build environment

```
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \
debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
pylint3 xterm python3-subunit mesa-common-dev
```
The build uses [kas](https://kas.readthedocs.io/en/latest/index.html) configuration.
Kas is a python module and can be installed via pip.


To install kas without using a virtual environment:
```
pip3 install kas
```

Optional: create a `kas-local.yml` file to customise the kas build system.

## Building
It's just one command to build the image:

```
kas build kas-main.yml:board-cm4.yml
```

If you have a `kas-local.yml` configuration then execute this instead:
```
```

The build will take hours as it will pull all the required sources and build everything from scratch, even its toolchain. Once completed the immage will be in `<BUILD DIR>/tmp/deploy/images/raspberrypi4-64/sandbox-image-raspberrypi4-64.wic.bz2` by default the `<BUILD DIR>` will be `build/`.


## Flashing to eMMC

This only applied to eMMC CM4 modules, if a SD card is used then follow your normal procedure.

This requires:

 * An `.wic.bz2` file
 * [rpiboot](https://github.com/raspberrypi/usbboot)
 * Micro USB cable connected to CM4

```
Extract the image using `bunzip2`.
sudo rpiboot
# Power on the CM4
# A new USB drive should appear somewhere under /dev/sdX
# (make sure it is unmounted)
sudo dd if=path/to/sandbox-image-raspberrypi4-64.wic of=/dev/sdX bs=4k status=progress
# Power off CM4 and unplug USB, wait 1 min
# Power on CM4
```
## Boot and Login

A shell should be available through UART0 which is GPIO 14 (Tx), GPIO 15 (Rx). The Ethernet should be configured with a static IP of `192.168.250.1/24` and ssh is enabled.

The user is `root` with no password.