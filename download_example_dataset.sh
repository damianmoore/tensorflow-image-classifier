#!/bin/sh
# curl -O http://download.tensorflow.org/example_images/flower_photos.tgz
mkdir -p tf_files/flowers/data
tar xzf flower_photos.tgz
mv flower_photos/* tf_files/flowers/data/
rm -r flower_photos
rm tf_files/flowers/data/*/[2-9]*  # Optional if you just want to try it quickly on a smaller dataset
