#!/bin/bash
#架构:arm64
#一键离线安装ROS2 Humble 版本
#适用于Ubuntu 22.04 LTS
#作者：super_ddg
#最后更新时间：2024-11-25


if [ "$EUID" -ne 0 ]; then
  echo "请以 root 用户执行此脚本。"
  exit 1
fi

echo -e "tar -xvzf ros2_deps.tar.gz"
tar -xvzf ros2_deps.tar.gz -C .
cp ros2_deps/local-debs.list /etc/apt/sources.list.d/ -f
cp ros2_deps /opt/ -rf
echo -e "----------开始安装ros2和相关构建工具------------"
mv /etc/apt/sources.list /etc/apt/sources.list.bak
apt update
apt install -y ros-humble-ros-base
apt install -y python3-colcon-common-extensions python3-pip python3-rosdep
mv /etc/apt/sources.list.bak /etc/apt/sources.list
rm /opt/ros2_deps -r
rm /etc/apt/sources.list.d/local-debs.list

sync

echo -e "\033[1;32m----------ros2和相关构建工具安装完成----------\033[0m"