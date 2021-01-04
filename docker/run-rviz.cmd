@ECHO OFF
FOR /F %%i IN ('cd') DO set FOLDER=%%~nxi

ECHO Starting RViz...
ECHO Make sure XMing is running on your machine!

docker run --rm -it --network %FOLDER%_default --env ROS_MASTER_URI=http://ros-moveit:11311 --env DISPLAY=host.docker.internal:0.0 gramaziokohler/ros-ur-planner:20.11 roslaunch ur10_moveit_config moveit_rviz.launch config:=true
