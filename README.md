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

4. BACKUP: run ```docker run -it humblesim bash```
   ORIGINAL: Run the ```run_sim_docker.sh``` script present in this repo

5. ```bash
   cd /root/neobotix_workspace
   ```

6. ```bash
   colcon build --symlink-install 

   echo "export LC_NUMERIC="en_US.UTF-8" " >> ~/.bashrc

   echo "source neobotix_workspace/install/setup.bash" >> ~/.bashrc
   ```

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
