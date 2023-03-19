function ObjVal = powerSum(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;
b=[8 18 44 114];

for i=1:Nind
for k=1:Nvar
    top1 = 0;
    for j=1:Nvar
        top1 = top1+power(x(i,j),k);
    end
    top = top+sqr(top1-b(k));
end;

ObjVal(i)=top;
top=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return