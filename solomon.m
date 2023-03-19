function out=solomon(X,str);
out=zeros(size(X,1),1);
for i=1:size(X,1)
    x=X(i,:);
    xx=norm(x);
    out(i)=-cos(2*pi*xx)+0.1*xx+1;
end
    