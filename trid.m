function ObjVal = trid(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;
top1=0;
for i=1:Nind
for j=2:Nvar
    top1= top1+sqr(x(i,j)-1);
    top= top+x(i,j)*x(i,j-1);
end;
top1=top1+sqr(x(i,1)-1);
ObjVal(i)= top1-top;
top=0;
top1=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return