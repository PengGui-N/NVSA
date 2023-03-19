function ObjVal = michalewics2(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);
x=Chrom;
m= 10;
top=0;
for i=1:Nind
    for j =1:Nvar
        top=top+sin(x(i,j))*power((sin(j*sqr(x(i,j))/pi)),(2*m));
    end
    ObjVal(i)=-top;
    top=0;
end

ObjVal=ObjVal';
function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;


  return