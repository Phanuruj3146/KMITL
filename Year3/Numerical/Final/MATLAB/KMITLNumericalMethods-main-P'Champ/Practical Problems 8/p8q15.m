%% Practical Problems 8 Question 15

% int(S,a,b) is the definite integral of S with respect to its symbolic variable from a to b

% Step 1: Create eqn
syms x
eqn = (-5.*(x.^2)) .* ((sin(2.*(x.^3))).^3) .* cos(2.*(x.^3));

% Step 2: Integrate
it = int(eqn, -pi/3, pi/4);
it_val = vpa(it);
disp(it_val);