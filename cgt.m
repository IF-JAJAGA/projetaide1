function [X_35,f_cgt_35] = cgt()
%CGT Summary of this function goes here
%   Detailed explanation goes here

matrix();
[best_x_ben, f_ben] = benefice();
ben_max = f_ben * best_x_ben;

ConstraintsA(11, :) = -f_ben;

T1l = [T1(:,3) T1(:,5)];
Tps1 = sum(T1l,2);

f_cgt_35 = Tps1;

ConstraintsB(11) = -ben_max * 0.80;
X_35 = linprog(f_cgt_35, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));

end

