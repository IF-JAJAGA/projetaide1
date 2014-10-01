function [ x ] = atelierJerome( f, ConstraintsA, ConstrainsB, AEQ, BEQ, LB, UB)
%ATELIERJEROME 
%   Retourne le nombre de produits en production maximale pour [A,B,C,D,E,F]
%   Exemple d'utilisation (cf fichier matrix.m) : 
%  x = atelierJerome(fonctionChefAtelier, ConstraintsA, ConstraintsB, [], [], zeros(6,1), [])

x = linprog(f, ConstraintsA, ConstrainsB,AEQ, BEQ, LB, UB);
end

