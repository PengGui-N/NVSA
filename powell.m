function ObjVal = powell(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;

for i=1:Nind
for j=1:ceil(Nvar/4)
    top = top+sqr(x(i,4*j-3)+10*(x(i,4*j-2)));
    top = top+5*sqr(x(i,4*j-1)-x(i,4*j));
    top = top+power(x(i,4*j-2)-x(i,4*j-1),4);
    top = top+10*power(x(i,4*j-3)-x(i,4*j),4);
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