projetaide1
===========

Premier Projet d'aide à la décision

Explication des variables utilisées dans context.mat : 
Ben = matrice de bénéfices qui représente la fonction qu'on cherche à maximiser
BenMin = Ben * -1  pour pouvoir utiliser la fonction linprog (qui minimise les fonctions) : f dans linprog
ConstraintsA = Matrice qui exprime les contraintes : A dans linprog
ConstraintsB = Matrice qui exprime les valeurs d'arrivée pour les contraintes : b dans linprog
T1 à T5 = tableaux contenus dans l'Annexe du document d'Aide à la décision
ZeroV = vecteur (6,1) contenant uniquement des 0 : lb dans linprog