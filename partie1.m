clear
matrix

X = zeros(5,6);
F = zeros(6,5);

[X(1,:),F(:,1)] = benefice;
[X(2,:),F(:,2)] = cgt;
[X(3,:),F(:,3)] = commercial;
[X(4,:),F(:,4)] = Stocks;
%[X(5,:),F(:,5)] = atelier;

Gains = X * F;
