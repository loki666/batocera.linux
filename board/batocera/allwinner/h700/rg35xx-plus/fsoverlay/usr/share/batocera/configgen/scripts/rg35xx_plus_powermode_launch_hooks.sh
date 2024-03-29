#!/bin/bash

EVENT=$1
SYSTEM_NAME=$2

test "$EVENT" = "gameStart" || test "$EVENT" = "gameStop" || exit 0

GPU_CTRL="/sys/kernel/debug/sunxi_gpu/write"

if ! [ -e /sys/kernel/debug/sunxi_gpu/write ]; then
	exit 0
fi

set_gpu_settings() {
	local FREQUENCY=$1
    local VOLTAGE=$2

	echo "frequency:1"          > $GPU_CTRL
	echo "voltage:$VOLTAGE"     > $GPU_CTRL
	echo "frequency:$FREQUENCY" > $GPU_CTRL
}

handle_powermode() {
	local POWERMODE_NAME=$1
		case "$POWERMODE_NAME" in
			"highperformance")
				set_gpu_settings "648" "960"
				;;
			"balanced")
				set_gpu_settings "552" "900"
				;;
			"powersaver")
				set_gpu_settings "420" "900"
				;;
			*)
		esac
}

# Handle gameStop event
if [ "$EVENT" = "gameStop" ]; then
	set_gpu_settings "420" "900"
	exit 0
fi

# Check for user set system specific setting
if [ -n "${SYSTEM_NAME}" ]; then
    POWER_MODE_SETTING="${SYSTEM_NAME}.powermode"
    POWER_MODE="$(/usr/bin/batocera-settings-get-master "${POWER_MODE_SETTING}")"
fi

# If no user set system specific setting check for user set global setting
if [ -z "${POWER_MODE}" ]; then
    POWER_MODE="$(/usr/bin/batocera-settings-get-master global.powermode)"
fi

# If no value is found ensure governor is system default before exiting
if [ -z "${POWER_MODE}" ]; then
	set_gpu_settings "420" "900"
	exit 0
fi

# select powermode
if ! [ -z "${POWER_MODE}" ]; then
	handle_powermode "${POWER_MODE}"
fi
