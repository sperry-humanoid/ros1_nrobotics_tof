FROM osrf/ros:noetic-desktop-full
WORKDIR /work

# Add display access so we can use RViz
ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1

# Install extra required dependencies
RUN apt update && apt install -y python3-pip python3-tk usbutils
RUN pip install pyserial

# Create the group and user with the same UID and GID (stops weird permissions on files created in mounted volumes inside the docker)
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g ${GROUP_ID} abc_group && useradd -m -u ${USER_ID} -g ${GROUP_ID} nrobot && echo "nrobot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER nrobot

# Source ROS install
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

ENTRYPOINT ["bash", "-c", "source /opt/ros/noetic/setup.bash && exec bash"]
