FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PACKAGECONFIG:append = " modemmanager"

SRC_URI += " \
    file://interfaces \
    file://rr-eth.nmconnection \
    file://rr-bridge.nmconnection \
    file://NetworkManager.conf \
    file://01-ifupdown \
    file://02-ethtool \
    "

FILES:${PN} += " \
    ${sysconfdir}/network \
    ${sysconfdir}/NetworkManager \
    "

do_install:append() {
    install -d ${D}${sysconfdir}/network
    install -d ${D}${sysconfdir}/NetworkManager/system-connections
    install -d ${D}${sysconfdir}/NetworkManager/conf.d
    install -d ${D}${sysconfdir}/NetworkManager/dispatcher.d
    install -m 0600 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
    install -m 0600 ${WORKDIR}/rr-eth.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections/rr-eth.nmconnection
    install -m 0600 ${WORKDIR}/rr-bridge.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections/rr-bridge.nmconnection
    install -m 0600 ${WORKDIR}/NetworkManager.conf ${D}${sysconfdir}/NetworkManager/NetworkManager.conf
    install -m 0755 ${WORKDIR}/01-ifupdown ${D}${sysconfdir}/NetworkManager/dispatcher.d/01-ifupdown
    install -m 0755 ${WORKDIR}/02-ethtool ${D}${sysconfdir}/NetworkManager/dispatcher.d/02-ethtool
}

# Prevent symlink of /etc/resolv.conf to nm - we manage this in rocketship
ALTERNATIVE:${PN}:remove = "resolv-conf"

