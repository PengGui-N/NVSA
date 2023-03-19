function ObjVal = branin(Chrom,switch1);

% Compute population parameters
   [Nind,Nvar] = size(Chrom);


      % BRANIN's RCOS function
      % -5 <= x1 <= 10 ; 0 <= x2 <= 15
      % global minimum at (x1,x2)=(-pi,12.275), (pi,2.275), and
      %                           (9.42478,2.475) ; fmin=0.397887
      x1 = Chrom(:,1);
      x2 = Chrom(:,2);
      ObjVal = (x2-(5.1/(4*pi^2))*x1.^2+(5/pi)*x1-6).^2+10*(1-(1/(8*pi))).*cos(x1)+10;
    return