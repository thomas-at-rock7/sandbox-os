FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += " \
    file://system.conf \
    "

PACKAGECONFIG:remove = " networkd resolved nss-resolve hostnamed timesyncd"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd
    install -m 0600 ${WORKDIR}/system.conf ${D}${sysconfdir}/systemd/system.conf
}
