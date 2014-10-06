function [X_3, f_cgt_3,f_cgt_5 f_cgt_35] = graphes_cgt( )
%GRAPHES_CGT Summary of this function goes here
%   Detailed explanation goes here
    matrix();
    [best_x_ben, f_ben] = benefice();
    ben_max = f_ben * best_x_ben;

    ConstraintsA(11, :) = -f_ben;

    cgt_res_3 = zeros(101, 1);
    cgt_res_5 = zeros(101, 1);
    cgt_res_35 = zeros(101, 1);
    for i = 0:100
        pourcentage = i / 100;
        
        Tps = sum(T1,2);
        T1l_3 = [T1(:,3)];
        T1l_5 = [T1(:,5)];
        T1l_35 = [T1(:,3) T1(:,5)];
        Tpsl_3 = sum(T1l_3,2);
        Tpsl_5 = sum(T1l_5,2);
        Tpsl_35 = sum(T1l_35,2);

        f_cgt_3 = (Tpsl_3 ./ Tps);
        f_cgt_5 = (Tpsl_5 ./ Tps);
        f_cgt_35 = (Tpsl_35 ./ Tps);

        ConstraintsB(11) = -ben_max * pourcentage;
        best_x_cgt_3 = linprog(f_cgt_3, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
        best_x_cgt_5 = linprog(f_cgt_5, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
        best_x_cgt_35 = linprog(f_cgt_35, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
        % L'indexation commence à 1, donc de 1 à 101 au lieu de 0 à 100
        
        cgt_res_3(i + 1) = f_cgt_3' * best_x_cgt_3;
        cgt_res_5(i + 1) = f_cgt_5' * best_x_cgt_5;
        cgt_res_35(i + 1) = f_cgt_35' * best_x_cgt_35;
    end
    
    plot(0:0.01:1, cgt_res_3, 'g-', 0:0.01:1, cgt_res_5, 'r-', 0:0.01:1, cgt_res_35);
    
    ConstraintsB(11) = -ben_max * 0.70;
    best_x_cgt_3 = linprog(f_cgt_3, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
    best_x_cgt_35 = linprog(f_cgt_35, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
    best_x_cgt_5 = linprog(f_cgt_5, ConstraintsA, ConstraintsB, [], [], zeros(6, 1));
    
    X_5 = best_x_cgt_5
    X_3 = best_x_cgt_3
    X_35 = best_x_cgt_35
    
end


