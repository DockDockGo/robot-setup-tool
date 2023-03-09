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

4. Run the ```run_sim.sh``` script present in this repo
