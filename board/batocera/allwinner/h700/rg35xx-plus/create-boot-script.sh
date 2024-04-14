#!/bin/bash

# HOST_DIR = host dir
# BOARD_DIR = board specific dir
# BUILD_DIR = base dir/build
# BINARIES_DIR = images dir
# TARGET_DIR = target dir
# BATOCERA_BINARIES_DIR = batocera binaries sub directory

HOST_DIR=$1
BOARD_DIR=$2
BUILD_DIR=$3
BINARIES_DIR=$4
TARGET_DIR=$5
BATOCERA_BINARIES_DIR=$6

mkdir -p "${BATOCERA_BINARIES_DIR}/boot/boot"     || exit 1

cp "${BINARIES_DIR}/rootfs.squashfs"        "${BATOCERA_BINARIES_DIR}/boot/boot/batocera.update" || exit 1
cp "${BOARD_DIR}/partitions/boot0.img"      "${BATOCERA_BINARIES_DIR}/boot/boot0.img"            || exit 1
cp "${BOARD_DIR}/bootlogo.bmp"              "${BATOCERA_BINARIES_DIR}/boot/bootlogo.bmp"         || exit 1
cp -r "${BOARD_DIR}/partitions"             "${BINARIES_DIR}"                                    || exit 1

exit 0
