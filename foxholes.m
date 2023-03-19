function ObjVal = FoxHoles(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
x=Chrom;
top=double(0);
top1=double(0);
a=[-32,-16,0,16,32,-32,-16,0,16,32,-32,-16,0,16,32,-32,-16,0,16,32,-32,-16,0,16,32;
    -32,-32,-32,-32,-32,-16,-16,-16,-16,-16,0,0,0,0,0,16,16,16,16,16,32,32,32,32,32];

for i=1:Nind
    for k=1:25
        for j=1:Nvar
          top1=top1+power((double(x(i,j))-double(a(j,k))),6);
        end;
        top=double(top+(1/(top1+k)));
        top1=0;
     end;
ObjVal(i)= double(1/(0.002+top));
top=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=double(x*x);

function y=power(x,a)
y=double(x^a);
  return