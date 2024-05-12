# OpenMVS

## 安装

```shell
# 安装图像格式相关库
apt install libpng-dev libjpeg-dev libtiff-dev libglu1-mesa-dev
# 安装Eigen
git clone https://gitlab.com/libeigen/eigen.git
mkdir eigen_build && cd eigen_build 
cmake ..
make && sudo make install 
cd ..
# 安装Boost
apt install libboost-iostreams-dev libboost-program-options-dev libboost-system-dev libboost-serialization-dev
# 安装OpenCV
apt install libopencv-dev
# 安装CGAL
apt install libcgal-dev libcgal-qt5-dev
# 安装GLEW
apt install libglew-dev
# 下载VCGLib  无需编译  导入即用  需设置环境变量
git clone https://github.com/cdcseacave/VCG.git vcglib
mv ./vcglib /usr/local/include
# 安装OpenMVS
git clone https://github.com/cdcseacave/openMVS.git
# 如无CUDA则关闭CUDA选项
SET(OpenMVS_USE_CUDA OFF CACHE BOOL "Enable CUDA library")
```

## 运行

```shell
git clone https://github.com/openMVG/ImageDataset_SceauxCastle.git
git clone https://github.com/cdcseacave/openMVS_sample.git
```

