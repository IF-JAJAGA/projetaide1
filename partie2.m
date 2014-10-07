matrix

X = zeros(5,6);
F = zeros(6,5);

[X(1,:),F(:,1)] = benefice;
[X(2,:),F(:,2)] = atelier;
[X(3,:),F(:,3)] = stocks;
[X(4,:),F(:,4)] = commercial;
[X(5,:),F(:,5)] = cgt;

clc

Gains = X * F;
Optim = Gains;

for i = 1:2
    Gains(:, i) = Gains(:, i) ./ VOptim(i, i);
end

% Cas particulier du stock (moins de stock = mieux)
Gains(:, 3) = VOptim(3, 3) ./ Gains(:, 3);

% Cas particulier du commercial (moins de difference = mieux)
% Pire des cas: le max des produits (donne par atelier) comme difference
Gains(:, 4) = ones(5, 1) - (Optim(:, 4) ./ VOptim(2, 2));

% Cas particulier de la cgt (moins d'utilisation machines 3_5 = mieux)
Gains(:, 5) = VOptim(5, 5) ./ Gains(:, 5);
