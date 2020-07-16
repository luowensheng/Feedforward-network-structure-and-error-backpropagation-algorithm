<p align="center">
    <a href="https://github.com/luowensheng"><img src="https://i.ibb.co/0FmPqfm/logo1a.png"></a>
</p>

<h1 align="center">Feedforward Network Structure and Error Backpropagation Algorithm
</h1>
<p align="center">
    <a href="https://www.mathworks.com/products/matlab.html"><img src="https://img.shields.io/badge/Made with-MATLAB-blue.svg"></a>
    <a href="https://github.com/luowensheng/ML_Feedforward-network-structure-and-error-backpropagation-algorithm/pulse"><img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg"></a>
    <a href="https://github.com/luowensheng"><img src="https://badges.frapsoft.com/os/v2/open-source.svg?v=103"></a>
</p>
<p align="center">
  <a href="#Introduction">Introduction</a> •
  <a href="#Tasks">Tasks</a> •
  <a href="#Method">Method</a> •
  <a href="#Results">Results</a> •
  <a href="#Questions">Questions</a>
</p>

___

<br>

# Introduction
[(Back to top :arrow_up_small:)](#Feedforward-Network-Structure-and-Error-Backpropagation-Algorithm)

This project is about **building a neural network to perform classification on a series of images**. The training process consists of feedforward propagation to make predictions and backpropagation to update the weights depending on the error given from the prediction. It has to be done using two layer and then using three layers. 

Neural network needs to be built in order to classify images into three classes. Particularly, we need to code on the feedforward network structure and error backpropagation algorithm in order to realize the learning process, instead of using related functions in ```MATLAB``` or ```Python```.


## Data
The data set contains images of three kinds of fruits: **Carambola**, **Lychee**, and **Pear**. Our task is to establish and train a neural network model capable of performing classification.
<p align="center"><img src="https://i.ibb.co/tLRQbqQ/1.jpg" alt="1" border="0"></a> </p>

In the data for training, each class has **490 images**, we need to partition this data to form the validation set.

Illustration of two layers neural network with three inputs nodes and three output nodes:
<p align="center"><img src="https://i.ibb.co/SxkyDyM/2.jpg" alt="2" border="0">

# Tasks
[(Back to top :arrow_up_small:)](#Feedforward-Network-Structure-and-Error-Backpropagation-Algorithm)
1.  To build a **two-layer neural network** to perform the classification to the images in the given data set. More detailed steps are as follows:

    * The very first step is to perform *dimensionality reduction* using ```principal component analysis (PCA)```.
    
        Then, employ PCA to map the images in the data down to 2 dimensions, i.e. extract the coefficients of the two principle components for the given data set. 

    * Build a two-layer neural network. The number of hidden units has to be decided. *Sigmoid function* is adopted as the nonlinear mapping in the hidden neurons, and train the weights using stochastic gradient descent. The backpropagation algorithm needs to be implemented in our code to evaluate the gradient.
        
        Note that the number of input nodes in the neural network here is three, corresponding to the two principal components and the bias.

    * Plot decision regions and discuss the training / testing performance with different settings designed.


2. To build a **three-layer neural network** to perform the classification to the images in the given data set. Also to show the decision regions and discuss the performance or decision boundary behavior difference from that in the previous part by adding one more layer here.

# Method
[(Back to top :arrow_up_small:)](#Feedforward-Network-Structure-and-Error-Backpropagation-Algorithm)

Due to the amount of complexity of a multi-layer neural network, many Matlab functions were designed:

* **Getdata**
    
    This function loads all the images in each category using the ```imagedatasore``` functionality and they will all be but into a cell.

* **Convertpca**

    This function take all the images in category of the cell containing the images, puts the vector form of each image in a matrix such that each column represents one image. Then that matrix will be reduced using ```PCA```. The number of components can be altered to get different dimensions for that data. The matrix will be placed in a cell and the outputs will be placed in the second column of that cell.

* **Getweights**
    
    This function randomly creates weights given the number of layers , the number of neurons and a bias. I have found that using all zeros for the weight matrices isn’t really efficient, as a result the weight matrices are calculated as such:
    ```
    Weight1=2*rand(m,n)-1*sqrt(number of neurons+output size)
    ```
    The weights are all stored in a cell, that way it is much easier to try different number of layers on the neural network.

* **Trainnetwork1**
    
    This function receives all the different parameters needed for training. I have used momentum as a way to increase the accuracy. The first phase is the feedforward propagation. It takes all the a 1 by 2 vector, add a bias to make it a 1 by 3 vector and multiplies the weight to the input vector, performs sigmoid with this output and get this new output and do the same thing until it gets to the last layer where it would perform a softmax instead of a sigmoid to make its final prediction. The next phase is backpropagation. The error will be found by subtracting the correct answer to the prediction then we will find the errors for each layer and the gradient for each weight by using the stochastic gradient descent method.

* **Predimg**
    
    This function functions similarly to the previous function. It utilizes feedforward to forward propagate and make predictions. It outputs a 3 by one vector and the location of the highest will be the prediction.

    To illustrate; because we have 3 categories, we have:
    ```
    Carumbula=[1 0 0]---->1
    Lychee=[0 1 0]---->2
    Pear=[0 0 1]----->3
    ```
    Also, if we have a final output of ```[0.25 0.5 0.25]```, the classifier would predict **2**.

* **Predimg2**
    
    This function works similarly as the previous one. The only difference is that it does not compare it prediction with the correct prediction.

* **Getdboundary**

    This function creates a new set of testing points using the testing data as such:
    ```
    for h1=min(test2{1,1}(:,2)):0.1:max(test2{1,1}(:,1))
        for h2=min(test2{1,1}(:,2))0.1:max(test2{1,1}(:,2))
    ```
    The network will classify these points to create different regions for each class.

# Results
[(Back to top :arrow_up_small:)](#Feedforward-Network-Structure-and-Error-Backpropagation-Algorithm)

## 2 Layer Network

* 5 neurons, 2 layers and 2 principal components; learning rate: 0.001

    <img src="https://i.ibb.co/gJNtv9v/3.jpg" alt="3" border="0"></a>
    <img src="https://i.ibb.co/m0CpHGS/4.jpg" alt="4" border="0"></a>
    <img src="https://i.ibb.co/xJVbBZL/5.jpg" alt="5" border="0"></a>

* 7 neurons

    <img src="https://i.ibb.co/HtqBKvB/6.jpg" alt="6" border="0"></a>
    <img src="https://i.ibb.co/NLVMPLb/7.jpg" alt="7" border="0"></a>

* 10 neurons, 200 epochs

    <img src="https://i.ibb.co/nQrzC9m/8.jpg" alt="8" border="0"></a>
    <img src="https://i.ibb.co/qFQnvM0/9.jpg" alt="9" border="0"></a>
    <img src="https://i.ibb.co/0FFJRfZ/10.jpg" alt="10" border="0"></a>

* 10 neurons, 500 epochs

    <img src="https://i.ibb.co/LgG80jL/11.jpg" alt="11" border="0"></a>
    <img src="https://i.ibb.co/6gkkzgd/12.jpg" alt="12" border="0"></a>
    <img src="https://i.ibb.co/x7Nt2H5/13.jpg" alt="13" border="0"></a>

## 3 Layer Network
* 5 neurons

    <img src="https://i.ibb.co/55d87zL/14.jpg" alt="14" border="0"></a>

* 7 neurons

    <img src="https://i.ibb.co/M8Q5bmd/15.jpg" alt="15" border="0"></a>
    <img src="https://i.ibb.co/z57C3Zt/16.jpg" alt="16" border="0"></a>
    
     Different result due to the weight initialization problem.

    <img src="https://i.ibb.co/m8YbBY5/17.jpg" alt="17" border="0"></a>

    When we remove ```PCA```, here is the result we can get after 100 epochs:

    <img src="https://i.ibb.co/2jvkcTg/18.jpg" alt="18" border="0"></a>

    With more epochs, the loss would eventually get really close to 0 and the accuracy would get to 100%.


# Questions
[(Back to top :arrow_up_small:)](#Feedforward-Network-Structure-and-Error-Backpropagation-Algorithm)

Submit your questions and bug reports [here](https://github.com/luowensheng/Natural-Language-Processing-Grammatical-Error-Correction-/issues).


<br>
<p align="center">
    <img src="https://forthebadge.com/images/badges/built-by-developers.svg"> <img src="https://forthebadge.com/images/badges/uses-git.svg"></a>
<p align="center">  
  <sub>© luowensheng.
  </a></p>
