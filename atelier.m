function [ best_x, f_atelier ] = atelier( )
%ATELIER Summary of this function goes here
%   Detailed explanation goes here

    matrix();
	f_atelier = [1 1 1 1 1 1]';
	best_x = linprog(-f_atelier, ConstraintsA, ConstraintsB, [], [], zeros(6, 1), []);

end

