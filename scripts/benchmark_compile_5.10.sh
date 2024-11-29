#!/bin/bash

set -xe

#benchmark package & common package compile
compile_packages() {
    DISTRO=$1
    shift
    PACKAGES="$@"
    echo "CPU: $DISTRO package: $PACKAGES"
    DISTRO=$DISTRO bitbake $PACKAGES
}

#64 package compile
compile_packages "m64lp64-s64lp64-u64lp64-k5.10xt-kcdebug-tcxt" "xuantie-common-pacakges" "xuantie-debug-tools" "perf"
compile_packages "c906fd" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c910v2" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c920v2" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
compile_packages "c906fdv" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
compile_packages "c908v" "aibench" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
