function ObjVal = stepint(Chrom,switch1);

% Dimension of objective function
   %Dim = 20;
   Dim=size(Chrom,2);
   
% Compute population parameters
   [Nind,Nvar] = size(Chrom);

      ObjVal = 25+sum((ceil(Chrom))')';
   return