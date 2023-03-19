function ObjVal = easom(Chrom,switchk);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);

x1 = Chrom(:,1);
x2 = Chrom(:,2);
ObjVal = -cos(x1).*cos(x2).*exp(-((x1-pi).^2+(x2-pi).^2));
    return