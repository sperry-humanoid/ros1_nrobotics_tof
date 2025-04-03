# NR ToFcam ROS node

## Full Setup Guide

1. Install Ubuntu 20.04 LTS on your PC or virtual machine of choice. Find the images here:

```
http://releases.ubuntu.com/focal/
```

2. Install ROS noetic. Follow the full official tutorial (all of chapter 1.x):

```
http://wiki.ros.org/noetic/Installation/Ubuntu
```

3. Create a ROS catkin workspace.

```bash
mkdir -p ~/catkin_ws/src
```

4. Extract the `nr_tofcam_ros_dist` package into the `src` folder of the catkin workspace.

5. Install dependencies.

```bash
sudo apt install -y python3-catkin-tools
```

6. Build the workspace.

```bash
cd ~/catkin_ws
catkin build
```

7. Source the workspace (has to be done once in every new terminal window).

```bash
source ~/catkin_ws/devel/setup.bash
```

## Configuring the node

To configure the node open the YAML file located here:

```bash
nano ~/catkin_ws/src/nr_tofcam_ros_dist/config/nr_tofcam_ros_dist_node.yaml
```

Make sure the IP address is set correctly and your host PC is on the same subnet.

Parameters with a `p_` prefix can also be configured during runtime (more on that later).
Parameters without a `p_` prefix can only be configured in this `.yaml` file and the node has to be restarted for the parameters to take effect.


## Running the node

Launch the ROS node in a terminal window.

```bash
roslaunch nr_tofcam_ros_dist nr_tofcam_ros_dist.launch
```

Launch the visualization in RViz in a second terminal window.

```bash
roslaunch nr_tofcam_ros_dist rviz.launch
```

For configuring parameters during runtime, open the dynamic reconfigure tool in a third terminal.

```bash
rosrun rqt_reconfigure rqt_reconfigure
```

If you found parameters that suit you better, you can change the default parameters in the before mentioned `.yaml` file (`p_` parameters).

