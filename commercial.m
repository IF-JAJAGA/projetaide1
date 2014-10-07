function [ best_x_commercial, f_difference ] = commercial( )
%COMMERCIAL fonction renvoyant le vecteur de produits correspondant au
%plus grand pourcentage de bénéfice max obtenu via graphes_commercial() et
%qui répond à la contrainte d'une égalité des deux familles de produits.
%Cette fonction renvoie également la fonction différence f_difference qui
%est la différence entre les deux familles de produits.

    matrix();
    [best_x_ben, f_ben] = benefice();
    ben_max = f_ben * best_x_ben;

    f_difference = [-1 -1 -1 1 1 1]';

    %p_max est le plus grand pourcentage du bénéfice max possible
    %répondant toujours à la contrainte d'une quantité des deux familles
    %équivalentes. Cette valeur est obtenue par l'étude du graphe de 
    %l'évolution des quantités des deux produits en fonction du pourcentage
    %du bénéfice max (via la fonction graphes_commercial().
    p_max = 0.7268;
    p_autre = p_max;
    
    ConstraintsA(11, :) = -f_ben;
    ConstraintsB(11) = -ben_max * p_autre;
    
    ConstraintsA(12, :) = -f_difference;
    ConstraintsB(12) = 0;
        
    best_x_commercial = linprog(f_difference, ConstraintsA, ConstraintsB, [], [], zeros(6, 1), []);
	
end

