docker run --gpus all -it --rm --env="DISPLAY" --env="NVIDIA_VISIBLE_DEVICES=all" --env="NVIDIA_DRIVER_CAPABILITIES=graphics,utility,compute" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="scripts:/tmp/scripts:rw" --env="QT_X11_NO_MITSHM=1" tensorflow/tensorflow:latest-gpu bash


docker build -t test-gym .

docker run --gpus all -it --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="QT_X11_NO_MITSHM=1" test-gym:latest