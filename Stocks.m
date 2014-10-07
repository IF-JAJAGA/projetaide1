function [ best_x_stocks, f_stocks ] = stocks( )
%STOCKS Summary of this function goes here
%   Detailed explanation goes here
    matrix;
    [best_x_ben, f_ben] = benefice();
    ben_max = f_ben * best_x_ben;
    f_stocks = sum(T2,1)' + ones(size(T2,2),1);
    
    pourcentage = 97.9/100;
    ConstraintsA(11, :) = -f_ben;
    ConstraintsB(11) = -ben_max * pourcentage;
    
    best_x_stocks = linprog(f_stocks, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
end

