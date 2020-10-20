#! /bin/sh


toUpdate=$(find /var/opkg-lists/ -mtime 3)

if [[ ! -f "/var/opkg-lists/openwrt_core" ]]; then
	toUpdate=1
fi

if [[ ! -z "${toUpdate}" ]]; then 
	opkg update >/dev/null
fi

upgradable=$(opkg list-upgradable)
if [[ ! -z "${upgradable}" ]]; then 
#	opkg list-upgradable | cut -f 1 -d '' | xargs opkg upgrade
	opkg list-upgradable | sed -e "s/\s.*//" | while read PKG_NAME; do opkg upgrade "${PKG_NAME}"; done
fi
