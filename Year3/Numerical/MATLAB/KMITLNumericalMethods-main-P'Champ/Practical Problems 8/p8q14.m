%% Practical Problems 8 Question 14

% Step 1: Create eqn. | Slides 41
syms x
eqn = (-5.*(x.^2)) .* ((sin(2.*(x.^3))).^3) .* cos(2.*(x.^3));

% Step 2: Integreate
it = int(eqn);
disp(it);