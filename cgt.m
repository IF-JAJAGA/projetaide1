function [x,fval] = cgt(T1,ConstraintsA,ConstraintsB)
%CGT Summary of this function goes here
%   Detailed explanation goes here
Tps = sum(T1,2);
T1l = [T1(:,3) T1(:,5)];
Tpsl = sum(T1l,2);

f = transpose(Tpsl ./ Tps);

[x,fval] = linprog(f,ConstraintsA,ConstraintsB,[],[],zeros(6,1));

end

