function ObjVal = hartman6(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
a=[10 3 17 3.5 1.7 8;0.05 10 17 0.1 8 14;3 3.5 1.7 10 17 8; 17 8 0.05 10 0.1 14];
c=[1,1.2,3,3.2];
p=[0.1312 0.1696 0.5569 0.0124 0.8283 0.5886;0.2329 0.4135 0.8307 0.3736 0.1004 0.9991;0.2348 0.1415 0.3522 0.2883 0.3047 0.6650; 0.4047 0.8828 0.8732 0.5743 0.1091 0.0381];

ObjVal=zeros(Nind,1);
top=0;
top1=0;
for k=1:Nind
for n=1:4
    for j=1:Nvar
      top1=top1+(a(n,j)*(Chrom(k,j)-p(n,j))^2);
    end;
    top=top+c(n)*exp(-top1);
    top1=0;
end
ObjVal(k)=-top;
top=0;
end

   return