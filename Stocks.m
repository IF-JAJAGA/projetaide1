function [ best_x_stocks, f_stocks ] = Stocks( )
% Non fonctionnelle actuellement
    %S = sum(T2',2) + ones(size(T2,2),1);
    
    matrix;
    [best_x_ben, f_ben] = benefice();
    ben_max = f_ben * best_x_ben;

    ConstraintsA(11, :) = -f_ben;

%    stocks = zeros(101, 1);
%     for i = 0:100
%         pourcentage = i / 100;
% 
%         f_stocks = sum(T2',2) + ones(size(T2,2),1);
% 
%         ConstraintsB(11) = -ben_max * pourcentage;
%         best_x_stocks = linprog(f_stocks, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
% 
%         % L'indexation commence à 1, donc de 1 à 101 au lieu de 0 à 100
%         stocks(i + 1) = f_stocks' * best_x_stocks;
%     end
%     
%     plot(0:0.01:1, stocks, '-');

    stocks = zeros(1001,1);
    
    f_stocks = sum(T2',2) + ones(size(T2,2),1);
    
    for i = 97500:98500
        pourcentage = i / 100000;
        
        ConstraintsB(11) = -ben_max * pourcentage;
        best_x_stocks = linprog(f_stocks, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));

        % L'indexation commence à 1, donc de 1 à 101 au lieu de 0 à 100
        stocks( mod(i, 97500) + 1) = f_stocks' * best_x_stocks;
    end
    plot(97.5:0.001:98.5, stocks, '-');
    
    pourcentage = 97.9/100;
    
    ConstraintsB(11) = -ben_max * pourcentage;
    best_x_stocks = linprog(f_stocks, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
    
end