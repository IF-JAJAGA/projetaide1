function analyse_multicritere( )
%{
	Calcul les matrice des concordance et discordance C et D pour la table des jugements J.
%}
	J = [6 5 5 5;
	5 4 9 3;
	3 4 7 3;
	3 7 5 4;
	5 4 3 9;
	2 5 7 3;
	5 4 2 9;
	3 5 7 4];		%Table des jugements
	
	P = [1 1 1 1];	%Matrice des pondérations des critères
	
	nbSolutions = size(J)(1,1);
	C = zeros(nbSolutions,nbSolutions);	%Matrice de concordance
	D = zeros(nbSolutions,nbSolutions);	%Matrice de discordance
	
	for i = 1:nbSolutions
		for j = 1:nbSolutions
			if (i==j)
				%On est sur la diagonale
				C(i,j) = 0;
				D(i,j) = 0;
			else
				%{
					Recherche dans la table des jugements
				%}
				%%%Concordance
				nbDomine = 0;	%Nombre de dominations de i sur j
				for k = 1:size(J)(1,2)
					if(J(i,k) >= J(j,k))
						nbDomine = nbDomine +1;
					end
				end
				C(i,j) = nbDomine;
				
				%%%Discordance
				maxi = 0;
				for k = 1:size(J)(1,2)
					dif = J(j,k) - J(i,k);
					if(dif > maxi)
						maxi = dif;
					end
				end
				D(i,j) = maxi;
				
			end
		end
	end
	
	C
	sommePonderation = sum(P)
	D
	echelleNote = 10
	
	
end
