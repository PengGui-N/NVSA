function ObjVal = schaffer(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);

for j=1:Nind
    x1=Chrom(j,1)^2;
    x2=Chrom(j,2)^2;
    pay=(sin(sqrt(x1+x2)))^2-0.5;
    payda=(1+0.001*(x1+x2))^2;
    ObjVal(j)=0.5+(pay/payda);
end
ObjVal=ObjVal';
 
  return