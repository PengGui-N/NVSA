clc
clear
% 1 <= FNCNO <=60
load FncData

for FNCNO =1:60
%FNCNO = 7 ; 

set_fnc_settings(FNCNO); 

out1 = algo_bsd(fnc,[],30,dim,low,up,10e2);

out2 = algo_besd(fnc,[],30,dim,low,up,10e2);

out3 = algo_bde(fnc,[],30,dim,low,up,10e2);

out4 = nvsa(fnc,[],30,dim,low,up,10e2);

out_all(FNCNO,1) = out1;
out_all(FNCNO,2) = out2;
out_all(FNCNO,3) = out3;
out_all(FNCNO,4) = out4;


end

