function analyse_multicritere( )
%{
	Calcul les matrice des concordance et discordance C et D pour la table des jugements J.
%}
	
	% J : table des jugements.
	J = [6 5 5 5;
	5 4 9 3;
	3 4 7 3;
	3 7 5 4;
	5 4 3 9;
	2 5 7 3;
	5 4 2 9;
	3 5 7 4];
	
	% P : matrice des pondérations des critères
	P = [1 1 1 1];	
	
	% ####	Test avec les matrices du cours (diapo 45->)	####
	%{
	%Dans le cours, il y a deux erreurs : D(C,G) = 1.6 et D(G,X) = 2.1.
	J = [6.6 3.8 5 6 5.6;
	6.2 4.4 5 6 5.6;
	5 5 5 5.5 5;
	6 3.8 5.9 5 5.4;
	6 5.6 5.6 4 5.8;
	6.6 4.4 5.6 5.5 6;
	6 6.5 2.6 7.5 6];
	
	P = [1.5 3 3 4 1.5];
	%}
	
	nbSolutions = size(J)(1,1);
	C = zeros(nbSolutions,nbSolutions);	%Matrice de concordance
	D = zeros(nbSolutions,nbSolutions);	%Matrice de discordance
	
	for i = 1:nbSolutions
		for j = 1:nbSolutions
			if (i==j)
				%On est sur la diagonale
				C(i,j) = 0.0;
				D(i,j) = 0.0;
			else
				%{
					Recherche dans la table des jugements
				%}
				%%%Concordance
				nbDomine = 0.0;	%Nombre de dominations de i sur j
				for k = 1:size(P)(1,2)
					%Boucle des critères.
					if(J(i,k) >= J(j,k))
						%On ajoute à nbDomine le coefficient pour le critère où i domine j.
						nbDomine = nbDomine +P(1,k);
					end
				end
				C(i,j) = nbDomine;
				
				%%%Discordance
				maxi = 0.0;
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
	echelleNote = 10.0	%echmax à donner (cf poly diapo 43)	
end
