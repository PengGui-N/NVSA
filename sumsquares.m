function ObjVal = sumSquares(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;
for i=1:Nind
for j=1:Nvar
    top=top+j*sqr(x(i,j));
end
ObjVal(i)=top;
top=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return