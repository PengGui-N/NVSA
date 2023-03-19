function ObjVal = Penalized(Chrom,switch1);
% Compute population parameters
[Nind,Nvar] = size(Chrom);

x=Chrom;
y=1+0.25*(Chrom+1);

a=10;
k=100;
m=4;

top=0;
top1=0;

u=zeros(size(Chrom));
for i=1:Nind
 for j=1:Nvar-1 
 u(i,j)=uhesapla(Chrom,i,j,a,k,m);
top=top+(sqr(y(i,j)-1)*(1+10*sqr(sin(pi*y(i,j+1)))));
top1=top1+u(i,j);
end;
u(i,Nvar)=uhesapla(Chrom,i,Nvar,a,k,m);
top1=top1+u(i,Nvar);
ObjVal(i)=((pi/Nvar)*(10*sqr(sin(pi*y(i,1)))+top+sqr(y(i,Nvar)-1)))+top1;
top=0;
top1=0;
end
ObjVal=ObjVal';

function y=sqr(x)
y=x*x;

function y=power(x,a)
y=x^a;

function u=uhesapla(chrom,i,j,a,k,m)
if chrom(i,j)>a 
    u=k*(chrom(i,j)-a)^m;
elseif ((chrom(i,j)<=a)||(chrom(i,j)>=-a))
     u=0;
else
    u=k*(-chrom(i,j)-a)^m;
end;    

  return
        
   
