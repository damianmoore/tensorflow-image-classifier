# tensorflow-image-classifier

With this tool you will be able to easily train an image classifier and then use it to classify other images.

We use a technique called transfer learning where we take a model called Inception v3 that has already been trained by Google on the ImageNet challenge dataset. This model is flexible enough that we only need to replace the final layer of the graph with our own training. This is much faster than doing the deep learning from scratch.

This project mainly follows the [TensorFlow for Poets tutorial](https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/index.html).

The quality of your classifier will depend mostly on how good your labelled dataset is. I will be posting some tools to aid in creating a good dataset soon.


## Requirements

* Docker
* git clone this project in a directory
* Sample images in labelled directories (though you can use an example dataset shown below)


## Getting started with an example dataset

The best way to get started is to try it out with an example dataset. Here we download a labelled dataset of flowers, move the photos into position, train the model against the dataset then use it to classify an image.
```
git clone git@github.com:damianmoore/tensorflow-image-classifier.git
./download_example_dataset.sh
./train.sh tf_files flowers -s 500  # This is the bit that will take a while to run (~20 mins on my laptop using the reduced dataset)
./classify.sh tf_files flowers tf_files/flowers/data/daisy/11124324295_503f3a0804.jpg
```

It should output something similar to the following probabilities:
```
daisy (score = 0.93466)
sunflowers (score = 0.04375)
dandelion (score = 0.01565)
tulips (score = 0.00516)
roses (score = 0.00078)
```


## Directory setup

You need a directory that will hold the tensorflow data, your images and the output graphs - this is usually called `tf_files`. Make a classifier directory in it which is the name of the classifier you are building. Inside that should be a directory `data` where you should put directories for each of the classification labels and then images within those.

For example:
```
tf_files/
tf_files/flowers/
tf_files/flowers/data
tf_files/flowers/data/daisy
tf_files/flowers/data/dandelion
tf_files/flowers/data/sunflowers
```

## Training

Train against the image samples for your classifier with 500 steps:
```
./train.sh path_to_tf_files classifier_name -s 500
```
Creating bottlenecks is the most time-consuming part and has to be done for each of the images. These bottlenecks are cached to disk though in `tf_files/bottlenecks` so only has to be done if new images are added. After the bottlenecks have been created, the main training and validation steps happen. The default (if no `-s` parameter is provided) is 4000 steps. The more steps you use for training, the more accurate the classificaiton should be, though you will hit a point of diminishing returns.


## Classifying

Classify an image against the trained graph:
```
./classify.sh path_to_tf_files classifier_name yourfile.jpg
```
The results are ordered with the strongest matches at the top along with the probability scores. A score of 0.93, for example, means the classifier is 93% sure of the label being correct.
