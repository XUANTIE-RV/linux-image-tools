#!/bin/bash

commands=(
    "DISTRO=m64lp64-s64lp64-u64lp64-k6.6ry-kcdebug-tcxt bitbake xuantie-image-lite"
    "DISTRO=m64lp64-s64lp64-u64lp64-k6.6ry-kcdebug-tcxt bitbake  u-boot"
    "DISTRO=m64lp64-s64lp64-u64lp64-k6.6ry-kcdebug-tcxt bitbake u-boot-fpga"
    "DISTRO=m64lp64-s64lp64-u64lp64-k6.6ry-kcdefault-tcxt bitbake xuantie-image-lite"
    "DISTRO=m64lp64-s64lp64-u64lp64-k6.6ry-kcdefault-tcxt bitbake linux-xuantie"
    "DISTRO=m32ilp32-s32ilp32-u32ilp32-k6.6ry-kcdebug-tcxt bitbake xuantie-image-lite"
    "DISTRO=m32ilp32-s32ilp32-u32ilp32-k6.6ry-kcdebug-tcxt bitbake  u-boot"
    "DISTRO=m32ilp32-s32ilp32-u32ilp32-k6.6ry-kcdebug-tcxt bitbake u-boot-fpga"
    "DISTRO=m32ilp32-s32ilp32-u32ilp32-k6.6ry-kcdefault-tcxt bitbake linux-xuantie"
)

for cmd in "${commands[@]}"; do
    echo "Executing: $cmd"
    eval $cmd  
done

echo "All commands executed."

