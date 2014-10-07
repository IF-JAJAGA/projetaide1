function [ best_x_commercial ] = commercial( )
%COMMERCIAL Summary of this function goes here

    matrix();
    [best_x_ben, f_ben] = benefice();
    ben_max = f_ben * best_x_ben;

    f_difference = [-1 -1 -1 1 1 1]';

    ConstraintsA(12, :) = -f_difference;
    ConstraintsB(12) = 0;
    
    ConstraintsA(11, :) = -f_ben;
    ConstraintsB(11) = -ben_max * 0.7268;
    
    best_x_commercial = linprog(f_difference, ConstraintsA, ConstraintsB, [], [], zeros(6, 1), []);
	
end

