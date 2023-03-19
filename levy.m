function y = levy(X,str)
% 
% Levy function 
% Matlab Code by A. Hedar (Nov. 23, 2005).
% The number of variables n should be adjusted below.
% The default value of n =2.
% 
n = 30;
y=zeros(size(X,1),1);
for h=1:size(X,1);
x=X(h,:);    
for i = 1:n; 
    z(i) = 1+(x(i)-1)/4; 
end

s = sin(pi*z(1))^2;

for i = 1:n-1
    s = s+(z(i)-1)^2*(1+10*(sin(pi*z(i)+1))^2);
end 
y(h) = s+(z(n)-1)^2*(1+(sin(2*pi*z(n)))^2);

end

