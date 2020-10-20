#! /bin/sh

sed -i 's/luci-app-attendedsysupgrade//g' /root/bin/opkg-*
sed -i 's/attendedsysupgrade-common//g' /root/bin/opkg-*
sed -i 's/auc//g' /root/bin/opkg-*
