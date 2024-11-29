#!/bin/bash

set -xe

compile_packages() {
    DISTRO=$1
    shift
    PACKAGES="$@"
    echo "CPU: $DISTRO package: $PACKAGES"
    DISTRO=$DISTRO bitbake $PACKAGES
}

compile_packages "m64lp64-s64lp64-u64lp64-k5.10xt-kcdebug-tcxt" "packagegroup-xuantie-optee" "opencv" "libeigen" "openblas" "libjpeg-turbo" "ffmpeg" "zstd" "zlib" "libpng" "csi-2d" "optee-os-fpga" "trusted-firmware-a-fpga" "u-boot-fpga"

compile_packages "c920v2" "opencv" "libeigen" "openblas" "libjpeg-turbo" "ffmpeg" "zlib" "libpng" "csi-2d" "csi-nn2-release"
compile_packages "c906fdv" "opencv" "libeigen" "openblas" "csi-nn2-release"
compile_packages "c908v" "opencv" "libeigen" "openblas" "libjpeg-turbo" "ffmpeg" "zstd" "zlib" "libpng" "csi-2d" "csi-nn2-release"
