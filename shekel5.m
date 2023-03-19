function ObjVal = shekel5(Chrom,switch1);

% Compute population parameters
[Nind,Nvar] = size(Chrom);
a=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9; 5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
c=[0.1 0.2 0.2 0.4 0.4 0.6 0.3 0.7 0.5 0.5];
ObjVal=zeros(Nind,1);
top=0;
top1=0;

for k=1:Nind
              for n=1:5
                   for j=1:Nvar
                       top1=top1+((Chrom(k,j)-a(n,j))*(Chrom(k,j)-a(n,j)));
                    end;
                  top1=top1+c(n);
                  top=top+(1/top1);
                  top1=0;
                end;
ObjVal(k)=-top;
top=0;
end

   return