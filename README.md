# Jess plays with Alloy

Someday maybe I'll put a model in here. Right now, the Dockerfile actually runs Alloy on Windows (after I installed X410 (an XWindow server)).

## X11 on linux (with podman)

To allow the image to connect to your running xserver do:

    podman run -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY jessitron/alloy
