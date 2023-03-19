function ObjVal = zakharov(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;
top1=0;
for i=1:Nind
for j=2:Nvar
    top1 = top1+sqr(x(i,j));
    top = top+0.5*j*x(i,j);
end;
ObjVal(i)= top1+sqr(top)+power(top,4);
top=0;
top1=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return