FILESEXTRAPATHS:prepend := "${THISDIR}/patches:"

SRC_URI += " \
            file://0001-Add-SPI6-4-Chip-Select-Overlay.patch \
            file://0002-Add-rocketship-usbhub-on-I2C1.patch \
            file://defconfig \
"

# Remove extra configs we don't need and use our own cut-down defconfig
SRC_URI:remove = " \
            file://android-drivers.cfg \
            file://initramfs-image-bundle.cfg \
            file://powersave.cfg \
            file://vc4graphics.cfg \
"
KBUILD_DEFCONFIG:raspberrypi4-64 = ""

# Modules to automatically load
KERNEL_MODULE_AUTOLOAD:append = " \
                                i2c-dev \
                                usb251xb \
                                spidev \
                                uvcvideo \
                                "

