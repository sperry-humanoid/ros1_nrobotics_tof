# ros1_nrobotics_tof
Ros1 Noetic Docker environment for testing nrobotics time of flight sensor

## Build and Run

### Build Container

```
docker-compose up -d --build
```

### Attach to container

```
docker exec -it <CONTAINER NAME> bash
```

### Build

```
catkin_make
```

### Source

```
source devel/setup.bash
```

### Run

Terminal 1
```
roslaunch nr_tofcam_ros_dist nr_tofcam_ros_dist.launch
```

Terminal 2

```
roslaunch nr_tofcam_ros_dist rviz.launch
```
