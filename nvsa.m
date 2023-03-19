
%{

Peng Gui et al., (2023), Normal Vibration Distribution Search-Based Differential Evolution Algorithm for
Multimodal Biomedical Image Registration, Neural Computing and Applications, (under review)


%}


function [solP,time]=nvsa(fnc,mydata,N,D,Low,Up,epk)

t0 = cputime; 

if numel(Low) < D, Low=repmat( Low,[1 D] ); end
if numel(Up)  < D,  Up=repmat(  Up,[1 D] ); end

p = rand(N,D); % memory
% see  Eq.(3) of the manuscript
for i = 1 : N
    for j = 1 : D
        p(i,j) = rand .* ( Up(j) - Low(j) ) + Low(j);
    end
end

%if isfield(mydata,'initsol'), p(1,:)=mydata.initsol; end

% see Eq.(4) of the manuscript
fitP = feval( fnc , p , mydata );


% see Eq.(5) of the manuscript
[~,j] = min( fitP );
bestP = p(j,:);

for epoch = 1 : epk
    
    % see Eq.(6) of the manuscript
    M = zeros(N,D) ;
    % see Lines 7-11 of Algorithm 1 of the manuscript
    for i = 1 : N
        alpha = GetAlpha;
        u = randperm( D, ceil( alpha * D ) ); 
        M(i,u) = 1;  
    end
    % see Eq.(14) of the manuscript
    if rand^3 < rand
        F = rand( N, D ).^3;
    else
        F = randn( N, D );
    end 
    
    % see Eq.(15) of the manuscript
    while 1
        L1 = randperm(N); 
        L2 = randperm(N);
        if sum( L1 == 1:N, 2)==0 && sum( L1 == L2, 2)==0 && sum( L2 == 1:N , 2 )==0
            break; 
        end
    end
    % see Eq.(15) of the manuscript
    w1 = rand( N, D ) ;w2=rand(N,D);
    E = ( w1 .* p(L1,:) + w2 .* p(L2,:) ) ;
    
    % see Eq.(15) of the manuscript
    w3=randn(N,D);   w4=rand(N,D);
    Trial = p +  F .*  M .* ( w3 .* E + w4 .* bestP   - p  ) ;
    
    % see Eq.(11) of the manuscript
    Trial = borderUpdate( Trial, Low, Up, N, D );
    
    % see Lines 18-19 of Figure#1 of the manuscript
    fitTrial = feval( fnc, Trial, mydata );
   
    
    j = fitTrial < fitP;
    fitP(j) = fitTrial(j);
    p(j,:) = Trial(j,:);
    [solP,j] = min(fitP);
    bestP = p(j,:);


    disp(['Iteration ' num2str(epoch) ': Best Cost = ' num2str(solP)]);
      time = cputime - t0;
    
end


function Trial = borderUpdate(Trial, Low, Up, N, D)
for i = 1 : N
    for j = 1 : D
        if Trial(i,j) < Low(j), Trial(i,j)  =  rand * ( Up(j)-Low(j) ) + Low(j) ; end
        if Trial(i,j) >  Up(j), Trial(i,j)  =  rand * ( Up(j)-Low(j) ) + Low(j) ; end
    end
end


% see Eq.(12) and Eq.(13), Normal vibration distribution
function p = GetAlpha
     beta = rand;
     a=1000;
     b=10000;
     c=3;
     d=5;
     curve=  c + (d-c)*rand;
     gamma = a + (b-a).*rand;
     sigma = rand;
     e=exp(1/(gamma*(beta-sigma)*(beta-sigma)+curve));
     p= exp(1./(curve))+2*(1-beta) * beta-e;
 





