function [ f ] = benefice( T1, T2, T41, T42, T5 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
    T1T = T1';
    fmax = T41 - (T42 * T2 + T5 * T1T);
    f = fmax .* -1;

end

