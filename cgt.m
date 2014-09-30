function [ Y ] = cgt( T1 )
%CGT Summary of this function goes here
%   Detailed explanation goes here

Tps = sum(T1,2);
T1l = [T1(:,3) T1(:,5)];
Tpsl = sum(T1l,2);

Y = Tpsl ./ Tps;

end

