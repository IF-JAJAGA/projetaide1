function[meilleur,f_atelier ] = graphes_atelier()
%ATELIERJEROME 
%   Retourne le nombre de produits en production maximale pour [A,B,C,D,E,F]
%   Exemple d'utilisation (cf fichier matrix.m) : 
%  x = atelierJerome(fonctionChefAtelier, ConstraintsA, ConstraintsB, [], [], zeros(6,1), [])

	[ConstraintsA, ConstraintsB, T1, T2, T3, T41, T42, T5] = matrix();    
	%matrix();
	[best_x_ben, f_ben] = benefice();
	ben_max = f_ben * best_x_ben;
	
	ConstraintsA(11, :) = -f_ben;
	
	f_atelier = [1 1 1 1 1 1]';
	nbProduits = zeros(101, 1);
	
	meilleur = zeros(6,1);
	maxi = 0;
	for i = 0:100
	 	pourcentage = i / 100;
	    	
	    	ConstraintsB(11) = -ben_max * pourcentage;
	
		best_x_atelier = linprog(f_atelier, ConstraintsA, ConstraintsB, [], [], zeros(6, 1), []);
		
		% L'indexation commence � 1, donc de 1 � 101 au lieu de 0 � 100
		nbProduits(i + 1) = f_atelier' * best_x_atelier;
		
		if(nbProduits(i+1)>maxi)
			maxi = nbProduits(i+1);
			meilleur = best_x_atelier;
		end
	end
	plot(0:0.01:1, nbProduits);
	
	SommeProduits = max(nbProduits);
	maxi
	meilleur
end

