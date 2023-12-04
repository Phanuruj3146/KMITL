%% Practical Problems 8 Question 12

% Step 1: Create an eqn. | Lecture 8 Slide 39
syms x y
eqn1 = 3*x - y == 12;
eqn2 = x + 3*y == -7;

% Step 2: Use solve()
% Syntax S = solve(eqn,var)
solution = solve([eqn1, eqn2], [x, y]);
disp(solution);