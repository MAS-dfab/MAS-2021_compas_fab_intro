@ECHO OFF
FOR /F %%i IN ('cd') DO set FOLDER=%%~nxi

ECHO Running command...
docker run --rm -it --network %FOLDER%_default -v "%~d0%~p0bag-files:/root/catkin_ws/bag-files" --env ROS_MASTER_URI=http://ros-moveit:11311 gramaziokohler/ros-ur-planner:20.11 %*
