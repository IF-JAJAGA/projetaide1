function [ best_x, f_ben ] = benefice( ben_max )
%BENFICE Calcule le b�n�fice maximal avec les contraintes de bases
%   Renvoie la meilleure combinaison de produits (best_x) et la m�thode de
%   calcul du b�n�fice (f_ben). Donc le b�n�fice maximal est f_ben * best_x

    matrix();
    T1T = T1';
    f_ben = T41 - (T42 * T2 + T5 * T1T);

    if nargin > 0
        ConstraintsA(11, :) = f_ben;
        ConstraintsB(11) = ben_max;
    end
    
    % Minimiser -f_ben <=> maximiser f_ben
    best_x = linprog(-f_ben',ConstraintsA,ConstraintsB,[],[],zeros(6,1), []);
end
