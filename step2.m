function ObjVal = step2(Chrom,switch1);

    Dim=size(Chrom,2);
    [Nind,Nvar] = size(Chrom);
    Chrom=ceil(Chrom+0.5);
    ObjVal = sum((Chrom .* Chrom)')';
  return