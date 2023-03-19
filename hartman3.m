function ObjVal = hartman3(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
a=[3,10,30;0.1,10,35;3,10,30;0.1,10,35];
c=[1,1.2,3,3.2];
p=[0.3689,0.1170,0.2673;0.4699,0.4387,0.7470;0.1091,0.8732,0.5547;0.038150,0.5743,0.8828];

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