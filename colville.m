function ObjVal = colville(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=0;
top1=0;
for i=1:Nind
ObjVal(i)= 100*sqr(sqr(x(i,1))-x(i,2))+sqr(x(i,1)-1)+sqr(x(i,3)-1)+90*sqr(sqr(x(i,3))-x(i,4))+...
10.1*(sqr(x(i,2)-1)+sqr(x(i,4)-1))+19.8*(x(i,2)-1)*(x(i,4)-1);
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;


  return