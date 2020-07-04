
function [R f r]=predimg(inputs,W)

num=length(W);
r=[];
R=[];
Y={};

f=[];


xn=inputs{1,1}';
tn1=inputs{2,1};
[mx nx]=size(xn);
for i=1:nx
tn=tn1(i,:)';

v=xn(:,i);

for k1=1:num
v=W{1,k1}*[v;1];
v=sigmfcn(v);
Y{1,k1}=[v;1];

end

y=softmax1(v);




c=find(y==max(y));
j=find(tn==max(tn));
if length(c)>1
r=[r; 0];  
else
r=[r; c];
end
f=[f;j];

end
R=[R ;sum(r==f)/length(f)];

end


