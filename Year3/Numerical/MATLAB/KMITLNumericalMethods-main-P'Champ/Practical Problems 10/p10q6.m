%% Practice Problems 10 Question 6

% func = @(x) 0.2 + 25*x - 200*(x.^2) + 675*(x.^3) - 900*(x.^4) + 400*(x.^5);
func = @(x) sin(x);
output = composite_simpson(func, 1, 2, 1000);
disp(output);