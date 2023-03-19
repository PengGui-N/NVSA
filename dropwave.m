function f = dropwave(X,str)
f=[];
for i=1:size(X,1)
    x=X(i,:);
f(i) = -(1 + cos(12*norm(x(1:2))))/(0.5*x(1:2)*x(1:2)'+2) ;  
end
f=f';
end 