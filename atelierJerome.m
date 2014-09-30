function [ x ] = atelierJerome( f, Constraints, ConstrainsB, lb)
%ATELIERJEROME 
%   Retourne le nombre de produits en production maximale pour [A,B,C,D,E,F]
%   Exemple d'utilisation (cf fichier context.mat) : 
%   x = atelierJerome(fonctionChefAtelier, Constraints, ConstraintsB, ZeroV)

x = linprog(f, Constraints, ConstrainsB, [], [] , lb);
end

