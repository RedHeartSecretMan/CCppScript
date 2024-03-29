#!/bin/bash

# 定义要创建和使用的构建目录
BUILD_DIR="build"

# 检查目录是否存在，如果存在，则删除
if [ -d "$BUILD_DIR" ]; then
  echo "Removing existing build directory..."
  rm -rf "$BUILD_DIR"
fi

# 创建一个新的构建目录
echo "Creating build directory..."
mkdir "$BUILD_DIR"

# 进入构建目录
cd "$BUILD_DIR" || exit

# 运行 cmake 配置
echo "Running cmake..."
BUILD_TYPE=$1
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..

# 构建项目
echo "Building..."
cmake --build --config $BUILD_TYPE .

echo "Build process completed."
