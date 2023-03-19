function ObjVal = sphere2(Chrom,switch1);

% Dimension of objective function
  % Dim = 20;
    Dim=size(Chrom,2);
 
   
% Compute population parameters
   [Nind,Nvar] = size(Chrom);

% function 1, sum of xi^2 for i = 1:Dim (Dim=30)
% n = Dim, -5.12 <= xi <= 5.12
% global minimum at (xi)=(0) ; fmin=0
 ObjVal = sum((Chrom .* Chrom)')';
   return