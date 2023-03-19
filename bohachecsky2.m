function ObjVal = bohachecsky2(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);
x=Chrom;
for i=1:Nind
ObjVal(i)=sqr(x(i,1))+2*sqr(x(i,2))-0.3*cos(3*pi*x(i,1))*(cos(4*pi*x(i,2)))+0.3 ;
end
ObjVal=ObjVal';
function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;


  return