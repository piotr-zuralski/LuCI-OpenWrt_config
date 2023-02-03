#! /bin/sh

opkg install wget coreutils-sha256sum

cd /tmp 
wget "https://downloads.openwrt.org/snapshots/targets/ath79/nand/openwrt-ath79-nand-netgear_wndr4300-v2-squashfs-sysupgrade.bin"
wget "https://downloads.openwrt.org/snapshots/targets/ath79/nand/sha256sums"
wget "https://downloads.openwrt.org/snapshots/targets/ath79/nand/sha256sums.asc"
 
# Import GPG public key
gpg --receive-keys 88CA59E88F681580
 
# Check GPG public key fingerprint
gpg --fingerprint 88CA59E88F681580
 
# Verify GPG signature
gpg --status-fd 1 --with-fingerprint --verify sha256sums.asc sha256sums 2>&1 | grep -e Good
 
# Verify SHA256 checksums
sha256sum --ignore-missing -c sha256sums 2> /dev/null | grep -e OK