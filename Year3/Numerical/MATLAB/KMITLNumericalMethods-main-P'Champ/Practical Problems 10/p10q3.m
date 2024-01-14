%% Practical Problems 10 Question 3

% Step 1: Data
t = [1 2 3.25 4.5 6 7 8 8.5 9 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];
p = polyfit(t, v, 3);  % Cubic

% Step 2: Integrate
func = @(x) p(4) + p(3)*x + p(2)*(x.^2) + p(1)*(x.^3);
output = integral(func, min(t), max(t));
disp(output);