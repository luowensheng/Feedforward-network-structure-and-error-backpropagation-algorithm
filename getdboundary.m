
function getdboundary(test2,C)

NT=[];

for h1=min(test2{1,1}(:,1)):0.1:max(test2{1,1}(:,1))

     for h2=min(test2{1,1}(:,2)):0.1:max(test2{1,1}(:,2))
 
NT=[ NT;h1 h2];
     end
end
 
 
    
    

 
[f1 sc1 ]=predimg2(NT,C);

figure,gscatter(NT(:,1),NT(:,2),f1)
title(' Decision region')
ylabel('2nd principal component')
xlabel('1st principal component')
legend( 'Carambola', 'Lychee','Pear')
end


