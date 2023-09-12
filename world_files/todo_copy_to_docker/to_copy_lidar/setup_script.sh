#!/bin/bash

sudo apt update
sudo apt install ros-humble-velodyne-gazebo-plugins
cd /root/neobotix_workspace/
export MY_ROBOT=mp_400
export MAP_NAME=neo_workshop
cp /home/admin/worlds/todo_copy_to_docker/to_copy_lidar/simulation.launch.py  /root/neobotix_workspace/src/neo_simulation2/launch
cp /home/admin/worlds/todo_copy_to_docker/to_copy_lidar/mp_400_with_lidar.urdf  /root/neobotix_workspace/src/neo_simulation2/robots/mp_400/
cp /home/admin/worlds/todo_copy_to_docker/to_copy_lidar/navigation.yaml /root/neobotix_workspace/src/neo_simulation2/configs/mp_400/

colcon build --symlink-install
source install/setup.bash
