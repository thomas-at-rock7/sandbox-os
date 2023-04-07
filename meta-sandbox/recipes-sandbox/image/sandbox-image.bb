
inherit core-image

DESCRIPTION = "Sandbox OS image"

MACHINE_FEATURES:append = " wifi usbhost"

IMAGE_FEATURES:append = " ssh-server-dropbear"

# Required for SSH by default a no password on root
IMAGE_FEATURES:appen = " debug-tweaks"

# Bring in the Raspberry Pi firmware for WiFi
IMAGE_INSTALL:append = " linux-firmware-rpidistro-bcm43455"

IMAGE_INSTALL:append = " \
    nano \
    vim \
    htop \
    picocom \
    screen \
    setserial \
    tmux \
    networkmanager-nmcli \
    strace \
    less \
    lsof \
    openssl \
    curl \
    iperf3 \
    traceroute \
    mtr \
    nftables \
    usb-modeswitch \
    iproute2 \
    iproute2-ss \
    iproute2-tc \
    bind-utils \
    tcpdump \
    zip \
    unzip \
    iputils \
    hostapd \
    mosquitto \
    opkg \
    ethtool \
    userland \
    "