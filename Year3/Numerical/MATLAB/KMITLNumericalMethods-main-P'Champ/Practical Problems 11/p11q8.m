%% Practical Problems 11 Question 8

func = @(x) (exp(x) .* sin(x)) ./ (1 + x.^2);

real_sol = integral(func, 0, 2);
disp(real_sol);

adaptive_sol = adaptive_quadrature(func, 0, 2, 1);