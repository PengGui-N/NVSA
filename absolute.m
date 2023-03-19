function out=absolute(X,str);
out=zeros(size(X,1),1);
for i=1:size(X,1)
    x=X(i,:);
    out(i)=sum(abs(x+0.5).^2);
end
    