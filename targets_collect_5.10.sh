#!/bin/bash

set -ex

ROOT_PATH=`pwd`
TOOLS_PATH="tools/bin2ext4"

DEB_PATH=${ROOT_PATH}"/../tmp-glibc/deploy/deb"
IMAGE_DEFAULT_C906fdv=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdefault@c906fdv-tcxt"
IMAGE_DEBUG_C906fdv=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdebug@c906fdv-tcxt"
IMAGE_DEFAULT_C908v=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdefault@c908v-tcxt"
IMAGE_DEBUG_C908v=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdebug@c908v-tcxt"
OPENTEE_BRINGUP_64k5_PATH=${ROOT_PATH}"/../tmp-glibc/work/riscv64_k5.10xt_kcdebug_tcxt-oe-linux/trusted-firmware-a/2.3-r0/git/build/qemu_xuantie/debug"
OPENTEE_TEEOS_64k5_PATH=${ROOT_PATH}"/../tmp-glibc/work/riscv64_k5.10xt_kcdebug_tcxt-oe-linux/trusted-firmware-a/2.3-r0/recipe-sysroot/usr/lib/optee-os/out/riscv/core"

OPENTEE_BRINGUP_C908V_64k5_PATH=${ROOT_PATH}"/../tmp-glibc/work/riscv64_k5.10xt_kcdebug@c908v_tcxt-oe-linux/trusted-firmware-a/2.3-r0/git/build/qemu_xuantie/debug"
OPENTEE_TEEOS_C908V_64k5_PATH=${ROOT_PATH}"/../tmp-glibc/work/riscv64_k5.10xt_kcdebug@c908v_tcxt-oe-linux/trusted-firmware-a/2.3-r0/recipe-sysroot/usr/lib/optee-os/out/riscv/core"

IMAGE_PATH_64k5_DEBUG_ROOTFS=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdebug-tcxt"
IMAGE_PATH_64k5_DEBUG=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdebug-tcxt"
IMAGE_PATH_64k5_DEFAULT=${ROOT_PATH}"/../tmp-glibc/deploy/images/riscv64-k5.10xt-kcdefault-tcxt"
IMAGE_PATH_64QEMU_UBOOT=${ROOT_PATH}"/../tmp-glibc/work/riscv64_k5.10xt_kcdebug_tcxt-oe-linux/u-boot/1_2024.10-r0/build/qemu-riscv64_smode_defconfig"
IMAGE_PATH_64FPGA_UBOOT=${ROOT_PATH}"/../tmp-glibc/work/riscv64_k5.10xt_kcdebug_tcxt-oe-linux/u-boot-fpga/1_2024.10-r0/build/fpga_xuantie_riscv64_smode_defconfig"

print_help(){
    echo -e "\033[32m ===\t\t This is a script used to generate Linux SDK \t\t\t==\033[0m"
    echo -e "\033[32m ** it will get MACHINE and IMAGE information from file build-id.txt saved in buildhistory** ==\033[0m"
}

do_copy_opensbi(){
    echo -e "\033[32m === copy opensbi image ==\033[0m"
    set -x
    mkdir -p archived/images/opensbi/
    cp ${IMAGE_PATH_64k5_DEBUG}/fw_dynamic.bin  archived/images/opensbi/fw_dynamic-v0.9-rv64.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64k5_DEBUG}/fw_dynamic.elf  archived/images/opensbi/fw_dynamic-v0.9-rv64.elf 
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
}
do_copy_optee(){
    echo -e "\033[32m === copy optee image ==\033[0m"
    set -x
    mkdir -p archived/images/optee/kernel5.10-rv64-fpga/bringup
    mkdir -p archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/bl1.bin archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/bl2.bin archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/bl31.bin archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/fip.bin archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
            echo "failed"
            exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/nt_fw_content.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/nt_fw_key.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/soc_fw_content.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/soc_fw_key.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/tb_fw.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/tos_fw_content.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/tos_fw_key.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_64k5_PATH}/trusted_key.crt archived/images/optee/kernel5.10-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    mkdir -p archived/images/optee/kernel5.10-rv64-qemu/tee-os
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_TEEOS_64k5_PATH}/tee-header_v2.bin archived/images/optee/kernel5.10-rv64-qemu/tee-os/bl32.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_TEEOS_64k5_PATH}/tee-pager_v2.bin archived/images/optee/kernel5.10-rv64-qemu/tee-os/bl32_extra1.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_TEEOS_64k5_PATH}/tee-pageable_v2.bin archived/images/optee/kernel5.10-rv64-qemu/tee-os/bl32_extra2.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${ROOT_PATH}/../tmp-glibc/work/riscv64_k5.10xt_kcdebug_tcxt-oe-linux/optee-os-fpga/3.15-r0/build/out/riscv/core/tee-pager_v2.bin archived/images/optee/kernel5.10-rv64-fpga/bringup
    cp ${ROOT_PATH}/../tmp-glibc/work/riscv64_k5.10xt_kcdebug_tcxt-oe-linux/trusted-firmware-a-fpga/2.3-r0/git/build/xiaohui/debug/bl31.bin archived/images/optee/kernel5.10-rv64-fpga/bringup
    set +x
}

do_copy_c908_optee(){
    echo -e "\033[32m === copy optee image ==\033[0m"
    set -x
    mkdir -p archived/images/optee/kernel5.10@c908v-rv64-fpga/bringup
    mkdir -p archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/bl1.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/bl2.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/bl31.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/fip.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
            echo "failed"
            exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/nt_fw_content.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/nt_fw_key.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/soc_fw_content.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/soc_fw_key.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/tb_fw.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/tos_fw_content.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/tos_fw_key.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_BRINGUP_C908V_64k5_PATH}/trusted_key.crt archived/images/optee/kernel5.10@c908v-rv64-qemu/bringup
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    mkdir -p archived/images/optee/kernel5.10@c908v-rv64-qemu/tee-os
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_TEEOS_C908V_64k5_PATH}/tee-header_v2.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/tee-os/bl32.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_TEEOS_C908V_64k5_PATH}/tee-pager_v2.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/tee-os/bl32_extra1.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${OPENTEE_TEEOS_C908V_64k5_PATH}/tee-pageable_v2.bin archived/images/optee/kernel5.10@c908v-rv64-qemu/tee-os/bl32_extra2.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${ROOT_PATH}/../tmp-glibc/work/riscv64_k5.10xt_kcdebug@c908v_tcxt-oe-linux/optee-os-fpga/3.15-r0/build/out/riscv/core/tee-pager_v2.bin archived/images/optee/kernel5.10@c908v-rv64-fpga/bringup
    cp ${ROOT_PATH}/../tmp-glibc/work/riscv64_k5.10xt_kcdebug@c908v_tcxt-oe-linux/trusted-firmware-a-fpga/2.3-r0/git/build/xiaohui/debug/bl31.bin archived/images/optee/kernel5.10@c908v-rv64-fpga/bringup
    set +x
}

do_copy_kernel(){
    echo -e "\033[32m === copy kernel5.10 image ==\033[0m"
    set -x
    mkdir -p archived/images/kernel
    cp ${IMAGE_PATH_64k5_DEBUG}/Image archived/images/kernel/Image-5.10-rv64-kcdebug
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64k5_DEBUG}/vmlinux archived/images/kernel/vmlinux-5.10-rv64-kcdebug
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64k5_DEFAULT}/Image archived/images/kernel/Image-5.10-rv64-kcdefault
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64k5_DEFAULT}/vmlinux archived/images/kernel/vmlinux-5.10-rv64-kcdefault
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEFAULT_C906fdv}/Image archived/images/kernel/Image-5.10-rv64-kcdefault@c906fdv
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEFAULT_C906fdv}/vmlinux archived/images/kernel/vmlinux-5.10-rv64-kcdefault@c906fdv
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEBUG_C906fdv}/Image archived/images/kernel/Image-5.10-rv64-kcdebug@c906fdv
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEBUG_C906fdv}/vmlinux archived/images/kernel/vmlinux-5.10-rv64-kcdebug@c906fdv
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi

    cp ${IMAGE_DEFAULT_C908v}/Image archived/images/kernel/Image-5.10-rv64-kcdefault@c908v
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEFAULT_C908v}/vmlinux archived/images/kernel/vmlinux-5.10-rv64-kcdefault@c908v
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEBUG_C908v}/Image archived/images/kernel/Image-5.10-rv64-kcdebug@c908v
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_DEBUG_C908v}/vmlinux archived/images/kernel/vmlinux-5.10-rv64-kcdebug@c908v
}
do_copy_uboot (){
    echo -e "\033[32m === copy u-boot image ==\033[0m"
    set -x
    mkdir -p archived/images/u-boot/
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64QEMU_UBOOT}/u-boot archived/images/u-boot/u-boot-qemu-rv64.elf
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64QEMU_UBOOT}/u-boot.bin archived/images/u-boot/u-boot-qemu-rv64.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64FPGA_UBOOT}/u-boot archived/images/u-boot/u-boot-fpga-rv64.elf
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64FPGA_UBOOT}/u-boot.bin archived/images/u-boot/u-boot-fpga-rv64.bin
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
}


# copy rootfs,if more than one rootfs have been compiled, all of them will be copied
do_copy_rootfs(){
    echo -e "\033[32m === copy rootfs,if more than one rootfs have been compiled, all of them will be copied ==\033[0m"
    set -x
    mkdir -p archived/images/rootfs
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64k5_DEBUG_ROOTFS}/${IMAGE}-riscv64-k5.10xt-kcdebug-tcxt.ext4 archived/images/rootfs/rootfs.xuantie-image-rv64-5.10-lite.ext4
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ${IMAGE_PATH_64k5_DEBUG_ROOTFS}/${IMAGE}-riscv64-k5.10xt-kcdebug-tcxt.cpio.gz archived/images/rootfs/rootfs.xuantie-image-rv64-5.10-lite.cpio.gz
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp -r ${ROOT_PATH}"/../../../meta-xuantie/recipes-bsp/hw-c9xx/files/fpga"  archived/
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp -r ${ROOT_PATH}"/../../../riscv-toolchain/bin/riscv64-unknown-linux-gnu-gdb" archived/fpga/riscv64-linux-gdb
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    set +x
}

do_copy_zsb(){
    echo -e "\033[32m === copy zsb, all of them will be copied ==\033[0m"
    set -x
    mkdir -p archived/images/zsb
    cp ${IMAGE_PATH_64k5_DEBUG_ROOTFS}/zero_stage_boot.bin archived/images/zsb/zero_stage_boot-rv64.bin
    cp ${IMAGE_PATH_64k5_DEBUG_ROOTFS}/zero_stage_boot.elf archived/images/zsb/zero_stage_boot-rv64.elf
}

# copy deb
do_copy_deb(){
    cmd_args=$*
    for item in $cmd_args; do
        if [ "$item" = "no-deb" ]; then
            echo "do_copy_deb() does not executed"
            return 0
        fi
    done

    echo -e "\033[32m === copy deb ==\033[0m"
    set -x
    cp -r ${DEB_PATH} ./
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    set +x
}

do_tarball(){
    cmd_args=$*
    version=$1
    if [ -z "$version" ]; then
        echo "请输入 version number"
        return 1
    fi
    for item in $cmd_args; do
        if [ "$item" = "no-tarball" ]; then
            echo "do_tarball() does not executed"
            return 0
        fi
    done
    echo -e "\033[32m === build tarball for ${MACHINE} ==\033[0m"
    set -x
    mkdir -p tarball
    rm -rf ./tmp/sdk_tarball
    mkdir -p ./tmp/sdk_tarball/
    cp -r archived ./tmp/sdk_tarball/
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cd ./tmp/sdk_tarball/ && tar -zcvf xuantie-linux-${version}_5.10.tar.gz archived && cd -
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    cp ./tmp/sdk_tarball/xuantie-linux-${version}_5.10.tar.gz ./tarball/
    if [ $? -ne 0 ]; then
        echo "failed"
        exit -1
    fi
    rm -rf ./tmp
    set +x
}

do_work(){
    cmd_args=$*

    echo -e "\033[32m === copy images, go through every MACHINE and copy target images ==\033[0m"
    BUILD_INFO_FILE=`find ${ROOT_PATH}/../buildhistory/  -name build-id.txt`
    echo "BUILD_INFO_FILE="${BUILD_INFO_FILE}
    for file in ${BUILD_INFO_FILE}
    do
        info=`cat ${file} |head -n 1`
        echo ${info}
        MACHINE=`echo ${info} |cut -d \: -f 1`
        #echo "MACHINE="${MACHINE}
        IMAGE=`echo ${info} | cut -d \: -f 2 |cut -d ' ' -f 2`
        echo "----------IMAGE="${IMAGE}
        #IMAGE_PATH=${ROOT_PATH}"/../tmp-glibc/deploy/images/"${MACHINE}
        #TARGET=`echo ${IMAGE##*-}`
        #echo "TARGET="${TARGET}

        #echo "create images/"${MACHINE}
        #mkdir -p images/${MACHINE}

        echo -e "\033[36m copy ${MACHINE} images\033[0m"
        do_copy_opensbi
        do_copy_rootfs
        #do_copy_optee
        #do_copy_uboot
        #do_copy_c908_optee
        do_copy_kernel
        do_copy_zsb
        do_tarball $cmd_args
        #break
    done
    do_copy_deb $cmd_args
}

finish(){
    echo -e -e "\033[32m Done \033[0m"
}

# start from here
cmd_args=$*

print_help
do_work $cmd_args
finish
echo "All done, SUCCESS!"
