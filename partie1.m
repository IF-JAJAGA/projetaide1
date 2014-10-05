clear
matrix

X = [];
F = [];

[X1,F1,ConstraintsA,ConstraintsB] = benefice(T1,T2,T41,T42,T5,ConstraintsA,ConstraintsB);
[X2,F2] = cgt(T1,ConstraintsA,ConstraintsB);
X=[X1,X2];
F=[F1;F2];