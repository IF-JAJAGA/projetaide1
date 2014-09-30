function [ S ] = Stocks( T2 )
%STOCKS Summary of this function goes here
%   Detailed explanation goes here
    S = sum(T2',2) + ones(size(T2,2),1);
end

