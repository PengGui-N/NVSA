function ObjVal = kowalik(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);
a=[0.1957,0.1947,0.1735,0.1600,0.0844,0.0627,0.0456,0.0342,0.0323,0.0235,0.0246];
b=[1/0.25,1/0.5,1/1,1/2,1/4,1/6,1/8,1/10,1/12,1/14,1/16];
ObjVal=zeros(Nind,1);
for j=1:Nind
    top=0;
    for i=1:11
        pay=Chrom(j,1).*((b(i).^2)+(b(i).*Chrom(j,2)));
        payda=(b(i).^2)+(b(i).*Chrom(j,3))+Chrom(j,4);
        top=top+(a(i)-(pay/payda)).^2;
    end
     ObjVal(j)=top;
end
 
  return