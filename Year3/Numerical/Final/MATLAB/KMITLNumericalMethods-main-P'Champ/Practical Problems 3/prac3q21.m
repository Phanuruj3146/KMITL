%% Practical Problems 3 Question 21

% creates an anonymous function for the function f(x) = x^2 – 3x + 1
func = @(x) x^2 - 3*x + 1;

% plots it between -4 and 4 with a grid
% Syntax: fplot(function, interval)
grid on
fplot(func, [-4 4]);