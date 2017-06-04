VOLUME="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
DATASET=$2
FILE="$(cd "$(dirname "$3")"; pwd)/$(basename "$3")"

docker run -v $VOLUME:/tf_files -v $FILE:/guess.jpg -w /tf_files/$DATASET damianmoore/tensorflow-image-classifier python /label_image.py /guess.jpg
