%% Practical Problems 8 Question 11

% Step 1: Create y and find exp.Taylor | Lecture 8 Slide 42
syms x
y = exp(-3.*(x.^2)).*sin(x.^7 - (5.*(x.^2)));
% Syntax: taylor(func, respect to ...., expansion point, 'Order', degree)
exp_taylor = taylor(y, x, -1, 'Order', 3);
disp(exp_taylor);