#! /bin/sh

if [[ ! -f "/etc/init.d/adblock" ]]; then
    exit 0
fi

mkdir -p "/tmp/adblock-base-tmp/" >/dev/null 2>&1
case $1 in
    "update")
        echo -e "[adblock] update"
        /etc/init.d/adblock restart
    ;;
    "quick-check"|*)
        if [[ ! -z "$(cat /tmp/adb_runtime.json | grep '\"adblock_status\": \"error\"')" ]]; then
            echo -e "[adblock] quick-check - error"
            /etc/init.d/adblock reload
        else
            echo -e "[adblock] quick-check - ok"
        fi
    ;;
esac
