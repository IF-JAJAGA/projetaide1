function [ x ] = atelierJerome( f, ConstraintsA, ConstrainsB, lb)
%ATELIERJEROME 
%   Retourne le nombre de produits en production maximale pour [A,B,C,D,E,F]
%   Exemple d'utilisation (cf fichier matrix.m) : 
%   x = atelierJerome(fonctionChefAtelier, Constraints, ConstraintsB, ZeroV)

x = linprog(f, ConstraintsA, ConstrainsB, [], [] , lb);
end

