# Feedforward-network-structure-and-error-backpropagation-algorithm
feedforward network structure and error backpropagation algorithm implementation

Due to the amount of complexity of a multi-layer neural network, I have designed many Matlab functions for this assignment. 


Getdata 

This function loads all the images in each category using the imagedatasore functionality and they will all be but into a cell.  
Convertpca 
This function take all the images in category of the cell containing the images, puts the vector form of each image in a matrix such that each column represents one image. Then that matrix will be reduced using PCA. The number of components can be altered to get different dimensions for that data. The matrix will be placed in a cell and the outputs will be placed in the second column of that cell.  



Getweights 

This function randomly creates weights given the number of layers , the number of neurons and a bias. I have found that using all zeros for the weight matrices isn’t really efficient, as a result the weight matrices are calculated as such: 
   Weight1=2*rand(m,n)-1*sqrt(number of neuurons+output size) 
The weights are all stored in a cell, that way it is much easier to try different number of layers on the neural network.  



Trainnetwork1 
This function receives all the different parameters needed for training. I have used momentum as a way to increase the accuracy. The first phase is the feedforward propagation. It takes all the a 1 by 2 vector, add a bias to make it a 1 by 3 vector and multiplies the weight to the input vector, performs sigmoid with this output and get this new output and do the same thing until it gets to the last layer where it would perform a softmax instead of a sigmoid to make its final prediction. The next phase is backpropagation. The error will be found by subtracting the correct answer to the prediction then we will find the errors for each layer and the gradient for each weight by using the stochastic gradient descent method.  
 
 
 
 
Predimg 

This function functions similarly to the previous function. It utilizes feedforward to forward propagate and make predictions. It outputs a 3 by one vector and the location of the highest will be the prediction. 
To illustrate because we have 3 categories we have, 
Carumbula=[1 0 0]---->1 
Lychee=[0 1 0]---->2 
Pear=[0 0 1]----->3 
Also if we have a final output of [0.25 0.5 0.25], the classifier would predict 2. 
 
 
 
 
Predimg2 
This function works similarly as the previous one. The only difference is that it does not compare it prediction with the correct prediction. 
 
 
 
 
Getdboundary 
This function creates a new set of testing points using the testing data

