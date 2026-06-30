#!/bin/bash

Xvfb :1 -screen 0 1280x800x24 &

export DISPLAY=:1

xfce4-session &

x11vnc -display :1 -rfbauth /root/.vnc/passwd -forever -shared -rfbport 5901 &

websockify --web=/usr/share/novnc/ 6080 localhost:5901
