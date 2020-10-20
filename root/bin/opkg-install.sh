#! /bin/sh

source /root/bin/opkg-upgrade.sh

opkg install \
	adblock \
	ca-bundle \
	ca-certificates \
	firewall \
	libgcc \
	libip4tc \
	libip6tc \
	libiwinfo \
	libjson-c \
	liblua \
	liblucihttp \
	libmbedtls \
	libubox \
	libubus \
	libuci \
	libuclient \
	libustream-mbedtls;

opkg install \
	libxtables \
	luci-app-adblock \
	luci-app-commands \
	luci-app-firewall \
	luci-mod-admin-full \
	luci-mod-rpc \
	luci-proto-ipv6 \
	tcpdump \
	wpad-basic ;
