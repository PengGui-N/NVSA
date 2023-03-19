function ObjVal = dixonPrice(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;

top=0;
for i=1:Nind
    for j=2:Nvar
        top = top+j*sqr(2*sqr(x(i,j))-x(i,j-1));
    end
    ObjVal(i)= top+sqr(x(i,1)-1);
    top=0;
end
ObjVal=ObjVal';
function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return