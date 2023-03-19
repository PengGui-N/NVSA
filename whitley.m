function out=whitley(X,str);
out=zeros(size(X,1),1);
for I=1:size(X,1)
    x=X(I,:);
    d=size(x,2);
    p=0;
    for i=1:d
        xi=x(i);
        for j=1:d
            xj=x(j);
            p=p+sum((100*(xi^2-xj)^2+(1-xj)^2)^2/4000-cos(100*(xi^2-xj)^2+(1-xj)^2)+1);
        end
    end
    out(I)=p;
end
    