function [W] = GetWeigths(numneurons,numlayers,is,os)

W={};
rr=sqrt(1/(numneurons+os));

if numlayers==1
t=is;    
   
W{1,1}=(2*rand(t,is)-1)*rr;
else
t=numneurons;
W{1,1}=(2*rand(t,is)-1)*rr;

for i=1:numlayers-1

   W{1,i+1}=(2*rand(t,t+1)-1)*rr;
    
end
if length(i)==0
    i=1;
end
    


[m n]=size(W{1,i});
W{1,i+1}= (2*rand(os,t+1)-1)*rr;

end



end

