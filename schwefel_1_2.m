function ObjVal = schwefel_1_2(Chrom,switch1);

   ObjVal = sum(cumsum(Chrom').^2)';
   return