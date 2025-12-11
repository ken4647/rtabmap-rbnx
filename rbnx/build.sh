#!/bin/bash
git submodule update --init

cd src/rtabmap_ros
git apply ../my_rtabmap_ros.patch

cd ../../

source /opt/ros/humble/setup.bash
rosdep update && rosdep install --from-paths src --ignore-src -r -y
export MAKEFLAGS="-j8" # Can be ignored if you have a lot of RAM (>16GB)
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release