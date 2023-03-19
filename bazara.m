% Bazaraa, M.S., Shetty, L.M., (1985), “Non-Linear Programming: Theory and
% Algorithms”, A.B.D., John Wiley & Sons.
% TEST FUNCTION
% opt:-7.16129
% (c)  besdok
function y=bazara(x,str);

y=-sum((-2*x(:,1).^2+2*x(:,1).*x(:,2)-2*...
    x(:,2).^2+4*x(:,1)+6*x(:,2)),2);
c1=(x(:,1)+x(:,2))<=2;
c2=(x(:,1)+5*x(:,2))<=5;
c3=x(:,1)>=0;
c4=x(:,2)>=0;
err=rand*1000;
y(~c1)=err;
y(~c2)=err;
y(~c3)=err;
y(~c4)=err;

end