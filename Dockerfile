# Firefox over VNC
#
# VERSION               0.1
# DOCKER-VERSION        0.2

from    ubuntu:14.04
#from ubuntu:latest
# make sure the package repository is up to date
run     apt-get update

# Install dependencies
run     apt-get install -y build-essential libsdl-mixer1.2-dev libsdl-net1.2-dev git gcc x11vnc xvfb wget
run     mkdir ~/.vnc

# Install docker client
run     apt-get install -y docker.io

# Setup a password
run     x11vnc -storepasswd 1234 ~/.vnc/passwd

# Setup doom
run     git clone https://github.com/GideonRed/dockerdoom.git
run     wget http://distro.ibiblio.org/pub/linux/distributions/slitaz/sources/packages/d/doom1.wad
run     cd /dockerdoom/trunk && ./configure && make && make install

# Autostart psdoom
run     bash -c 'echo "/usr/local/games/psdoom -warp E1M1" >> /root/.bashrc'