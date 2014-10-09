precision = 100;

[Gains, VOptim] = partie2();

vrai_benefice = VOptim(1, 1);

Satisfactions = zeros(precision, 4);

for i = precision:1
    [Gains, Optim] = partie2(VOptim, vrai_benefice * (i / precision));
    Satisfactions(i, :) = Gains(1, 2:end);
end

x = 0.01:0.01:1;

plot(x, Satisfactions(:, 1), 'r-', x, Satisfactions(:, 2), 'g-');
