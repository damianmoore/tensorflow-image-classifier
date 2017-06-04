#!/bin/bash
VOLUME="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
DATASET=$2

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--steps)
    STEPS="$2"
    shift
    ;;
esac
shift
done

echo Training "${DATASET}" dataset with "${STEPS:-4000}" steps

docker run -v $VOLUME:/tf_files damianmoore/tensor-guess python /retrain.py \
    --bottleneck_dir=/tf_files/bottlenecks \
    --how_many_training_steps=${STEPS:-4000} \
    --model_dir=/tf_files/inception \
    --summaries_dir=/tf_files/training_summaries/basic \
    --output_graph=/tf_files/$DATASET/retrained_graph.pb \
    --output_labels=/tf_files/$DATASET/retrained_labels.txt \
    --image_dir=/tf_files/$DATASET/data
