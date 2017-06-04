FROM tensorflow/tensorflow:1.1.0

MAINTAINER Damian Moore "damian@epixstudios.co.uk"

WORKDIR /

COPY src/retrain.py /
COPY src/label_image.py /
