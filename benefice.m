function [ x, fval, ConstraintsA, ConstraintsB ] = benefice(T1,T2,T41,T42,T5,ConstraintsA,ConstraintsB)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    T1T = T1';
    fmax = T41 - (T42 * T2 + T5 * T1T);
    f = fmax .* -1;
    [x,fval] = linprog(f,ConstraintsA,ConstraintsB,[],[],zeros(6,1));
    fval = fval.*-1;
    
    %On ajoute à la matrice B des contraintes la valeur de 80% de bénéfice
    %qu'on veut
    ConstraintsB = [ConstraintsB;(fval*0.8)];
    %On ajoute à la matrice A les valeurs correspondantes de produits pour
    %les 80% qu'on veut. A terminer...
    ConstraintsA = [ConstraintsA; (x.*0.8)'];
end
