#!/bin/bash

set -xe

commands=(
    "DISTRO=m64lp64-s64lp64-u64lp64-k5.10xt-kcdebug-tcxt bitbake linux-xuantie opensbi"
    "DISTRO=m64lp64-s64lp64-u64lp64-k5.10xt-kcdefault-tcxt bitbake linux-xuantie"
    "DISTRO=m64lp64-s64lp64-u64lp64-k5.10xt-kcdefault@c906fdv-tcxt bitbake linux-xuantie"
    "DISTRO=m64lp64-s64lp64-u64lp64-k5.10xt-kcdebug@c906fdv-tcxt bitbake linux-xuantie"
    "DISTRO=m64lp64-s64lp64-u64lp64-k5.10xt-kcdefault@c908v-tcxt bitbake linux-xuantie"
    "DISTRO=m64lp64-s64lp64-u64lp64-k5.10xt-kcdebug@c908v-tcxt bitbake linux-xuantie"
)

for cmd in "${commands[@]}"; do
    echo "Executing: $cmd"
    eval $cmd  
done

echo "All commands executed."

