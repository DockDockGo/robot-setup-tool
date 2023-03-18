# robot-setup-tool

Tools for setting up your Neobotix's simulation workspace

# Setup Process

1. Clone this repo

2. ```bash
   cd ./robot_setup-tool
   ```

3. Run the following command 
   ```bash
   docker build -f Dockerfile.humble22 . -t humblesim
   ```

4. BACKUP: 
   ```docker run -it humblesim bash```
   
   Better to do:
   ```chmod +x run_sim_docker.sh```
   ```./run_sim_docker.sh```

5. ```bash
   cd /root/neobotix_workspace
   ```

6. ```bash
   colcon build --symlink-install 

   echo "export LC_NUMERIC="en_US.UTF-8" " >> ~/.bashrc

   echo "source neobotix_workspace/install/setup.bash" >> ~/.bashrc
   ```

7. Set Environment Variables (note you need to set your own world file inside the neobotix's world folder)
   ```bash
   export MY_ROBOT=mp_400
   export MAP_NAME=neo_workshop
   ```

8. Install tmux and rviz2
   ```bash
   sudo apt install tmux
   sudo apt install ros-humble-rviz2
   ```

9. Create multiple tmux panes, in each you must set environment variables of step 7

10. Run Simulation in first tmux pane
   ```bash
   ros2 launch neo_simulation2 simulation.launch.py
   ```

11. Run Navigation in Simulation in second tmux pane
   ```bash
   ros2 launch neo_simulation2 navigation.launch.py map:=/root/neobotix_workspace/src/neo_simulation2/maps/neo_workshop.yaml
   ```
   
12. Run rviz2 in third tmux pane
   ```bash
   ros2 launch neo_nav2_bringup rviz_launch.py
   ```

# Using Custom World Files for Simulation

1. Use ```world_files``` folder to copy the ```trial_world.world``` into the ```~/neobotix_workspace/src/neo_simulation2/worlds``` folder
2. Use ```world_files``` folder to copy the entire folder ```mfi_floor_trial1``` into ```~/neobotix_workspace/src/neo_simulation2/models``` folder
3. Change ```export MAP_NAME=trial_world```
4. Run the simulation as in step 10 in previous section

# Using Custom World Files for Navigation

This will require mapping the custom world and saving a map. This will be done shortly

# Appendix

1. If you want to stop any active running continers
   ```bash
   docker rm $(docker ps -a -q)
   ```

2. If you want to retry docker image builds after changing something in this repo, it's suggested to delete existing images which are not required:
   ```bash
   docker images
   docker rmi <image_tag_or_ID>
   ```
3. If you face issues with display driver not working, then before running the run_sim_docker.sh do:
   ```bash
   xhost +local:docker
   ```
