clear all
close all
clc



[test1,train1] = GetData();
NL=2;
[test2] = convertpca(test1,NL,1);%the one is for pca, any other value will remove PCA

[train2] = convertpca(train1,NL,1);



[m inputsize]=size(train2{1,1});
[ms outputsize]=size(train2{2,1});


numneurons=7;
numlayers=3;



W=GetWeigths(numneurons,numlayers,inputsize+1,outputsize);

epoch=100;
alpha=0.001;
beta=0.9;
[W loss r C K maxAcc]=trainnetwork1(train2, test2,W,epoch,alpha,beta);


figure
subplot(2,1,1),plot(loss);
title('Squared error')
xlabel('epoch')
ylabel('Squared error')

loss(end);

subplot(2,1,2),plot(r);
title('Accuracy')
xlabel('epoch')
ylabel('Accuracy')
r(end);




figure
gscatter(test2{1,1}(:,1),test2{1,1}(:,2),K{1,2})
title(' Scatter plot of the predictions for the testing data')
ylabel('2nd principal component')
xlabel('1st principal component')
legend( 'Carambola', 'Lychee','Pear')

if NL==2
    
getdboundary(test2,C)

end







































































































































