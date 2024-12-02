1、5.10/6.6 images collect

cd xuantie-build/xuantie

git clone git@gitee.com:xuantie-yocto/linux-image-tools.git -b 1.0

cd linux-image-tools

./targets_collect_6.6.sh

./targets_collect_5.10.sh

2、Software package compile

cd xuantie-build/xuantie

./benchmark_compile_5.10.sh

./benchmark_compile_6.6.sh

3、5.10/6.6 images compile

cd xuantie-build/xuantie

./build-images_5.10.sh

./build-images_6.6.sh

