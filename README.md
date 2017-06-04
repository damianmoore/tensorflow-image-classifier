# tensorflow-image-classifier

With this tool you will be able to easily train an image classifier and then use it to classify other images.

We use a technique called transfer learning where we take a model called Inception v3 that has already been trained by Google on the ImageNet challenge dataset. This model is flexible enough that we only need to replace the final layer of the graph with our own training. This is much faster than doing the deep learning from scratch.

This project mainly follows the [TensorFlow for Poets tutorial](https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/index.html).

The quality of your classifier will depend mostly on how good your labelled dataset is. I will be posting some tools to aid in creating a good dataset soon.


## Requirements

* Docker
* git clone this project in a directory
* Sample images in labelled directories (though you can use an example dataset shown below)


## Directory setup

You just need a directory that will hold the tensorflow data, your images and the output graphs - this is usually called `tf_files`. Make a classifier directory in it which is the name of the classifier you are building. Inside that should be a directory `data` where you should put all your images.

For example:
```
  ~/tf_files/
  ~/tf_files/classifier_name/
  ~/tf_files/classifier_name/data
  ~/tf_files/classifier_name/data/daisy
  ~/tf_files/classifier_name/data/dandelion
  ~/tf_files/classifier_name/data/sunflowers
```
Once you have run the training process, your classifier directory will also have trained classifier output graph.


## Training

Train against the image samples for your classifier with 500 steps:
```
./train.sh path_to_tf_files classifier_name -s 500
```


## Classifying

Classify an image against the trained graph:
```
./classify.sh path_to_tf_files classifier_name /yourfile.jpg
```


## Getting started with example dataset

You can quickly try this out with an example dataset.
```
curl -O http://download.tensorflow.org/example_images/flower_photos.tgz
mkdir -p tf_files/flowers/data
tar xzf flower_photos.tgz
mv flower_photos/* tf_files/flowers/data/
rm -r flower_photos
./train.sh tf_files flowers -s 4000
./guess.sh tf_files flowers tf_files/flowers/data/daisy/5547758_eea9edfd54_n.jpg
```

It should output the following:
```
daisy (score = 0.98380)
dandelion (score = 0.00941)
sunflowers (score = 0.00610)
tulips (score = 0.00048)
roses (score = 0.00020)
```
