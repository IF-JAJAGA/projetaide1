function [ eq ] = commercial( A, b, z )
%COMMERCIAL Summary of this function goes here
%   Detailed explanation goes here

f1 = [1 1 1 -1 -1 -1]';
f2 = [-1 -1 -1 1 1 1]';

x1 = linprog ( f1, A, b, [], [], z );
x2 = linprog ( f2, A, b, [], [], z );

eq = 1/2 * (x1 + x2);
end

