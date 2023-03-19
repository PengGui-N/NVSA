function ObjVal = shubert(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;
top1=0;
for i=1:Nind
for j = 1 :5
    top = top+j*cos((j+1)*x(i,1)+j);
    top1 = top1+j*cos((j+1)*x(i,2)+j);
end;
ObjVal(i)=top*top1;
top=0;
top1=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return