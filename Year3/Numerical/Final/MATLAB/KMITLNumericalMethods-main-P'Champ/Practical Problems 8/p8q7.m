%% Practical Problems 8 Question 7

% Step 1: Domain
dval = 0.3:0.3:0.9;
d = [dval dval dval]';
s = [0.001 0.001 0.001 0.01 0.01 0.01 0.05 0.05 0.05]';
q = [0.04 0.24 0.69 0.13 0.82 2.38 0.31 1.95 5.66]';

% Linearise the data อิงจากโจทย์
logD = log(d);
logS = log(s);

% Step 2: Use multiple linear regression to fit
z = [ones(size(d)) logD logS];
a = (z'*z)\(z'*log(q));

% Similar to the last lecture, grab a value to create a function
real_alpha = exp(a(1));

% Step 3: Create eqn.
func = @(d, s) real_alpha .* d.^a(2) .* s.^a(3);

% Step 4: Test and display
fprintf('Test function with diameter = 0.3m and slope = 0.001 m/m = %f\n', func(0.3, 0.001));
fprintf('Qfit = %f*D^%f*S^%f\n', real_alpha, a(2), a(3));