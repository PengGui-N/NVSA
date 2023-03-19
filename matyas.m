function ObjVal = matyas(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);
x=Chrom;
for i=1:Nind
ObjVal(i)=0.26*(sqr(x(i,1))+sqr(x(i,2)))-0.48*x(i,1)*x(i,2);
end
ObjVal=ObjVal';
function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;


  return