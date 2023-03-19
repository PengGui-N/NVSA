function ObjVal = schwefel_2_22(Chrom,switch1);

 ObjVal = sum((Chrom .* Chrom)')'+prod((Chrom .* Chrom)')';
   return