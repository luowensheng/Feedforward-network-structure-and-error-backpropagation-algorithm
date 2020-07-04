
function [f sc ]=predimg2(inputs,W)

num=length(W);

Y={};

f=[];
sc=[];

xn=inputs';

[mx nx]=size(xn);
for i=1:nx


v=xn(:,i);

for k1=1:num
v=W{1,k1}*[v;1];
v=sigmfcn(v);
Y{1,k1}=[v;1];

end

y=softmax1(v);

f=[f find(y==max(y))];
sc=[sc y];
end

end
