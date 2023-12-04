%% Practical Problems 8 Question 13

% Step 1: Create eqn. | Slides 41
syms x
func = ((x.^2).*(cos(2.*(x.^3)))) ./ (((x.^2) - 1).^2 - sin(x));

% Step 2: Differentiate
df = diff(func);
disp(df);