%% Practical Problems 11 Question 6

func = @(z) 200 .* (z ./ (5+z)) .* exp((-2.*z) / 30);
real_sol = integral(func, 0, 30);
romberg_sol = romberg(func, 0, 30, 0.5);
disp(real_sol);
disp(romberg_sol);