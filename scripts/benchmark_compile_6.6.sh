#!/bin/bash

#benchmark package & common package compile
compile_packages() {
    DISTRO=$1
    shift
    PACKAGES="$@"
    echo "CPU: $DISTRO package: $PACKAGES"
    DISTRO=$DISTRO bitbake $PACKAGES
}

#64 package compile
compile_packages "m64lp64-s64lp64-u64lp64-k6.6ry-kcdebug-tcxt" "xuantie-common-packages" "xuantie-debug-tools"
compile_packages "c906fdv" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
compile_packages "c907fdv" "aibench" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
compile_packages "c907fdvm" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c908v" "aibench" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
compile_packages "c920v2" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3"  "iperf2"
compile_packages "r908fdv" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "r908fdv-cp" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c920v3" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c920v3-cp" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "r908fd" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "r908fd-cp" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c906fd" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c908" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c910v2" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c907fd" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
#32 package compile
compile_packages "m32ilp32-s32ilp32-u32ilp32-k6.6ry-kcdebug-tcxt" "xuantie-common-packages" "xuantie-debug-tools"
compile_packages "c907fd-rv32" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c907fdv-rv32" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
compile_packages "c907fdvm-rv32" "coremark" "dhrystone" "unixbench" "lmbench" "sysbench" "iperf3" "iperf2"
