  function ObjVal = quartic(Chrom,switch1);
   [Nind, Nvar] = size(Chrom);
   nummer = repmat(1:Nvar, [Nind 1]);

top=0;
for i=1:Nind
for j=1:Nvar
    top=top+j*(Chrom(i,j)^4);
end
ObjVal(i)=top+rand;
top=0;
end
ObjVal=ObjVal';
  % ObjVal = sum(nummer'.*((Chrom) .^ 4)')'+rand(Nind,1);

  return