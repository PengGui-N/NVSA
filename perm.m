function ObjVal = perm(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
b=0.5;

top=0;

for i=1:Nind
for k=1:Nvar
      top1=0;
        for j= 1:Nvar
          top1 = top1+(power(j,k)+b)*(power((x(i,j)/j),k)-1);
        end
      top= top+sqr(top1);
    end ;
ObjVal(i)=top;
top=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;
  return