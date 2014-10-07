function graphes_commercial ()
    %[ConstraintsA, ConstraintsB, T1, T2, T3, T41, T42, T5] = matrix();    
    matrix();
    [best_x_ben, f_ben] = benefice();
    ben_max = f_ben * best_x_ben;

    f_difference = [-1 -1 -1 1 1 1]';
    f_famille_1 = [1 1 1 0 0 0];
    f_famille_2 = [0 0 0 1 1 1];
    
    ConstraintsA(11, :) = -f_ben;
    ConstraintsA(12, :) = -f_difference;
    
    ConstraintsB(12) = 0;

    famille_1 = zeros(101, 1);
    famille_2 = zeros(101, 1);
    difference = zeros(101, 1);

    for i = 0:100
        pourcentage = i / 100;

        ConstraintsB(11) = -ben_max * pourcentage;
        best_x_commercial = linprog(f_difference, ConstraintsA, ConstraintsB, [], [], zeros(6, 1), []);

        % L'indexation commence � 1, donc de 1 � 101 au lieu de 0 � 100
        famille_1(i + 1) = f_famille_1 * best_x_commercial;
        famille_2(i + 1) = f_famille_2 * best_x_commercial;
    end
	
    difference = famille_2 - famille_1;
    
    plot(0:0.01:1, famille_1, '-', 0:0.01:1, famille_2, 'r-', 0:0.01:1, difference, 'g--');

end
