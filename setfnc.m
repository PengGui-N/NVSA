function setfnc(f)
load('FncData.mat');
fnc=Fnc{f}; 
low=FncLow(f); 
up=FncUp(f); 
dim=FncDim(f); 
assignin('base','fnc',fnc);
assignin('base','low',low);
assignin('base','up',up);
assignin('base','dim',dim);
