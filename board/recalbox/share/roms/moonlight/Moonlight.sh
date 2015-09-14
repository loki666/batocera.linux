#!/bin/bash

cd /recalbox/share/roms/moonlight/
moonlight_dir=$PWD
moonlight_mapping="$moonlight_dir/mapping.conf"
moonlight_conf="$moonlight_dir/moonlight.conf"
moonlight_keydir="$moonlight_dir/keydir"

mkdir -p $moonlight_keydir;

case $1 in
    map)
        cmd="moonlight map ${moonlight_mapping} -keydir ${moonlight_keydir} -config ${moonlight_conf}" ;;

    pair)
        cmd="moonlight pair -keydir ${moonlight_keydir} -config ${moonlight_conf}" ;;

    *)
        cmd="moonlight stream -keydir ${moonlight_keydir} -mapping ${moonlight_mapping} -config ${moonlight_conf}" ;;

esac

exec $cmd
