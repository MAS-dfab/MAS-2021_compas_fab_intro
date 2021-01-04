# MAS Docker example

This docker container launches MoveIt planner for a UR10 robot (with or without
RViz GUI) and allows to record and playback ROS bag files as well as running
arbitrary commands on the container.

## Getting started

Once Docker is running, run `docker-compose up -d` from this directory or use
VS Code and click `Compose Up` on the `docker-compose.yml` file in this directory.

After the container is running, you're ready to start playing with the UR10 robot
in it using COMPAS FAB, eg:

```python
from compas.geometry import Frame
from compas_fab.backends import RosClient

with RosClient() as client:
    robot = client.load_robot()
    frame = Frame([0.3, 0.1, 0.5], [1, 0, 0], [0, 1, 0])
    config = robot.inverse_kinematics(frame)
    print("Found configuration", config)
```

## Other features

Once the container is running, there are a number of additional features that are possible:

### Open RViz, the GUI for ROS

First install and run [`XMing`](https://sourceforge.net/projects/xming/) and then execute the following:

    run-rviz

### Run commands inside docker

Use the following:

    run-in-docker <command>

For example, to get a list of all topics:

    run-in-docker rostopic list

### ROS bag files

To playback a ROS bag file, add the file into the `bag-files` folder and run the following
replacing `<session_name.bag>` for the name of the bag file you want to playback:

    run-in-docker rosbag play /root/catkin_ws/bag-files/<session_name.bag>

### Configure nodes to launch

The container uses the `main.launch` file in the directory `launch` to determine
what is executed on start. Edit the file and restart the container for the
changes to take effect.
