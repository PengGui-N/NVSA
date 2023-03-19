% http://www-optima.amp.i.kyoto-u.ac.jp/member/student/hedar/Hedar_files/TestGO.htm
function y = hump(X,str)
% 
% Hump function 
% Matlab Code by A. Hedar (Sep. 29, 2005).
% The number of variables n = 2.
% 
y=[];
for i=1:size(X,1);
x=X(i,:);
y(i)=1.0316285+4*x(:,1)^2-2.1*x(:,1)^4+x(:,1)^6/3+x(:,1)*x(:,2)-4*x(:,2)^2+4*x(:,2)^4;
end
y=y';
return
