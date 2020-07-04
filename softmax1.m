function y=softmax1(y)
ex=exp(y);
y=ex/sum(ex);


end

