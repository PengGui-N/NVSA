%{ 

example

clear all
set_fnc_settings(24)
out=algo_besd(fnc,[],30,dim,low,up,1e6) ;

%}
function set_fnc_settings(i)

load FncData.mat
assignin('base','fnc', Fnc(i)); 
assignin('base','low', FncLow(i)); 
assignin('base','up',  FncUp(i)); 
assignin('base','dim', FncDim(i)); 
whos