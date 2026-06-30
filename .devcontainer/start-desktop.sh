#!/bin/bash

# Start virtual framebuffer
Xvfb :1 -screen 0 1280x800x24 &

export DISPLAY=:1

# Start XFCE
xfce4-session &

# Start VNC server
x11vnc -display :1 -rfbauth /root/.vnc/passwd -forever -shared -rfbport 5901 &

# Start noVNC
websockify --web=/usr/share/novnc/ 6080 localhost:5901
