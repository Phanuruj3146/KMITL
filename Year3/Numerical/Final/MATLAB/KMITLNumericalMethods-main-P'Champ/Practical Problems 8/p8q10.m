%% Practical Problems 8 Question 10

% Step 1: Create an eqn.
syms x
eqn = x.^3 + 3.*(x.^2) - x - 3;

% Step 2: Use solve
output = factor(eqn);
disp(output);