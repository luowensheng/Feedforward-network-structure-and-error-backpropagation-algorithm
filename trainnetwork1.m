
function [W loss acc C K Ac]=trainnetwork1(inputs,input2,W,epoch,a,beta)
C=0;
K={};
c1=0;
loss=[];
y=0;
acc=[];
for ep=1:epoch
num=length(W);

mmt={};
Y={};
delta={};
E={};
%setup momentum
for i=1:num
mmt{1,i}=zeros(size(W{1,i}));
end


xn=inputs{1,1}';
tn1=inputs{2,1};


for i=1:length(xn)
tn=tn1(i,:)';

x=xn(:,i);



%v=[x;1];
v=x;

for k1=1:num-1
v=W{1,k1}*[v;1];
v=sigmfcn(v);
Y{1,k1}=[v;1];
%v=[v;1];

end
v=W{1,num}*[v;1];
%y=softmax1(v);
Y{1,num}=softmax1(v);

E{1,num}=tn-Y{1,num};

%find error and delta for SGD
delta{1,num}=Y{1,num}.*(1-Y{1,num}).*E{1,num} ;

for k2=num-1:-1:1
    E{1,k2}=W{1,k2+1}(:,1:end-1)'*delta{1,k2+1};
delta{1,k2}=Y{1,k2}(1:end-1).*(1-Y{1,k2}(1:end-1)).*E{1,k2} ;
k1=k1-1;
end


%update weights
dw=a*delta{1,1}*[x;1]';

for k4=1:num-1
mmt{1,k4}=dw+beta*mmt{1,k4};
W{1,k4}=W{1,k4}+mmt{1,k4};   
dw=a*delta{1,k4+1}*(Y{1,k4})';   
    
end
y=y+mean(E{1,num}.^2);


end
loss=[loss y/epoch];
[R f r]=predimg(input2,W);

if R>c1
    c1=R;
    C=W;
    K{1,1}=f;
    K{1,2}=r;
    Ac=R;
end

acc=[acc R];
y=0;
end

end

