function ObjVal = booth(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);
x=Chrom;
for i=1:Nind
ObjVal(i)=sqr(x(i,1)+2*x(i,2)-7)+sqr(2*x(i,1)+x(i,2)-5);
end
ObjVal=ObjVal';
function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;

  return