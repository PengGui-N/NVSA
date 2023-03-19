function settestfnc(fncname)

    p=importdata('benchmark_fnc_list.xls');
    [i,j]=ismember(fncname,p.textdata);
if i
    fncname=p.textdata{j};
    a=p.data(j,:);
    assignin('base','low',a(1));
    assignin('base','up',a(2));
    assignin('base','dim',a(3));
    assignin('base','fnc',fncname);
else 
    disp('function/function name is not found')
end
