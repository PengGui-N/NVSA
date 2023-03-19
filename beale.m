function ObjVal = beale(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);

for j=1:Nind
  ObjVal(j)=sqr(1.5-Chrom(j,1)*(1-Chrom(j,2)))+sqr(2.25-Chrom(j,1)*(1-power(Chrom(j,2),2)))+sqr(2.625-Chrom(j,1)*(1-power(Chrom(j,2),3)));
end
ObjVal=ObjVal';
function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;


return