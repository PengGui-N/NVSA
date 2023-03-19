function ObjVal = sixhumpcamelback(Chrom,switchh);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);


      % six-hump camelback function
      % -3 <= x1 <= 3 ; -2 <= x2 <= 2
      % global minimum at (x1,x2)=(-0.0898,0.7126),(0.0898,-0.7126) ; fmin=-1.0316
      x1 = Chrom(:,1);
      x2 = Chrom(:,2);
      ObjVal = (4-2.1*x1.^2+1/3*x1.^4).*x1.^2+x1.*x2+(-4+4*x2.^2).*x2.^2;
    return