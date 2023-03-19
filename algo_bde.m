
%{

"Bernstein-Levy Differential Evolution Algorithm" 

Title of Paper  : Bernstein-Levy Differential Evolution Algorithm for Numerical Function Optimization

Authors         : Civicioglu, P. (1), Besdok, E. (2)
Adress (1)      : Erciyes University, Faculty of Aeronautics and Astronautics, Dept. of Aircraft Electrics and Electronics, Kayseri, Turkey
Adress (2)      : Erciyes University, Faculty of Engineering, Dept. of Geomatics Eng., Kayseri, Turkey
E-mail          : ebesdok@erciyes.edu.tr  (Corresponding Author)
Status          : Submitted to Journal, Under-Review


(c) CIVICIOGLU, BESDOK  ( 04.02.2022 )


%}


function globalminimum  = algo_bde(fnc, mydata, N, D, low, up, epoch )

% initialization
pattern_vectors = rand( N, D ) * ( up - low ) + low ;  % see, line 2 of fig.1
fitness_of_pattern_vectors = feval( fnc, pattern_vectors, mydata ) ;   % see, line 3 of fig.1
[~, ind] = min( fitness_of_pattern_vectors );   % see, line 4 of fig.1
globalminimizer = pattern_vectors ( ind, : ) ;  % initial objective function value of global solution vector 

% iterative search phase
for epk = 1 : epoch
    
    % generation of bijective-direction vectors
    while 1
        j1 = randperm( N );
        j2 = randperm( N );        
        if sum( j1 == 1:N ) == 0 && sum( j2 == 1:N ) == 0  && sum( j1 == j2 ) == 0 ; break ; end
    end
    dv1 = pattern_vectors( j1, : ) - pattern_vectors ; % bijective, because of [ j1 neq 1:N ], see line 6 of fig.1
    dv2 = pattern_vectors( j2, : ) - pattern_vectors ; % bijective, because of [ j2 neq 1:N ] and [ j2 neq j1 ], see line 7 of fig.1
    
    % generation of elitist-direction vectors, see lines 8-13 of fig.1
    mbest = pattern_vectors ;
    for i = 1 : N
        if rand < rand
            mbest(i,:) = globalminimizer +  rand.^3 * ( up - globalminimizer ) ;  % see, line 10 of fig.1
            mbest(i,:) = mbest(i,:)      +  rand.^3 * ( low - globalminimizer ) ;  % see, line 11 of fig.1
        else
            mbest(i,:) = globalminimizer ; % see, line 12 of fig.1
        end
    end
    dv3 = mbest - pattern_vectors ;  % the elitist direction-vector component, see line 13 of fig.1
    
    % evolutionary step size
    if ( rand < rand^3 ) , c = 1 ; else, c = N ; end     % line 15 of fig.1
    
    % Levy-Distributed Scale Factor (i.e., evolutionary step size)
    % see : https://en.wikipedia.org/wiki/Levy_distribution
    Scale = 1 ./ gamrnd( 0.5, randi( [1 16] ) / 2, [c 1] ) ;    % see lines 16-18 of fig.6
    
    % bi-forms of mutation operator
    if rand < rand
        % the first method of mutation operator
        dv = dv1 + Scale .* ( dv3 - dv2 ) ;  % bijective mode. see line 21 of fig.1
    else
        % the second method of mutation operator
        w = 3 * randn(N,3) ;         % uniform-combination weights
        dv =  Scale .* ( w(:,1) .*  dv1  +   w(:,2) .*  dv2  +   w(:,3) .* dv3 ) ;   % elitist model. see, line 25 of fig.1
    end
        
    % generation of crossover control matrix ; map  ( % see, lines 27-34 of  fig.1)
    map = zeros( N, D ) ;
    for j = 1: N
        h = randperm( D ) ;
        if rand < rand
            m = bernsteinMatrix( randi(3), rand ) .^ 3;
            w = m( randi( numel(m) ) );
        else
            if rand < rand, w = rand .^ randi( [3 5] ); else, w = ( 1 - rand .^ randi( [3 5] ) ) ; end
        end
        map( j, h( 1 : ceil( w * D ) ) ) = 1;
    end
    
    % mutation (i.e., morphogenesis)  and  crossover
    mutation_patterns = pattern_vectors +  map .* dv ;    % see, line 36 of fig.1
    
    % border control  ( line 38 of fig.1 )
    for i = 1 : N    
        for j = 1 : D
            if mutation_patterns(i,j) < low || mutation_patterns(i,j) > up, mutation_patterns(i,j) = rand * ( up - low ) + low ; end
        end
    end
    
    % Update    ( see, lines 40-41 of fig.1 )
    ft = feval(fnc,mutation_patterns, mydata);
    ind = ft < fitness_of_pattern_vectors ;                                        % line 31 of fig.1
    pattern_vectors( ind,: ) = mutation_patterns( ind, : ) ;                       % line 31 of fig.1
    fitness_of_pattern_vectors( ind )  = ft( ind ) ;                               % line 31 of fig.1
    
    % update the best solution ( see, line 43 of fig.1) 
    [globalminimum, bestindex] = min( fitness_of_pattern_vectors ) ;               % line 33 of fig.1
    globalminimizer = pattern_vectors( bestindex, : ) ;                            % line 33 of fig.1
    
    % export the statistics and solutions
    out.globalminimum = globalminimum ;
    out.globalminimizer = globalminimizer ;    
        
    % display results
    fprintf('%5.0f -->  %12.16f \n', epk, globalminimum );        
    assignin('base','out', out ); % Export solutions to workspace. This line can slow down BeSD. Do not use this line if it is not necessary.
    
end




