# 目录说明

```
├── README.md
├── scripts      // 存放编译脚本
|   ├── benchmark_compile_5.10.sh
│   ├── benchmark_compile_6.6.sh
│   ├── build-images_5.10.sh
│   └── build-images_6.6.sh 
├── tarball       // 镜像目录，存放编译好的镜像文件
├── targets_collect_6.6.sh   // 6.6镜像打包脚本
└── targets_collect_5.10.sh  // 5.10镜像打包脚本
```

# 镜像打包脚本

“targets_collect*.sh” 脚本可以用来将编译好的镜像打包。使用说明：

1.  将linux-image-tools拷贝到编译完成的 xuantie-build/xuantie 文件夹下
2.  运行脚本：
    6.6：./targets_collect_6.6.sh v1.0.6
    5.10：./targets_collect_5.10.sh v1.0.6

# tarball 镜像目录

存放打包好的镜像文件


