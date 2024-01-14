%% Practical Problems 8 Question 8

% Step 1: Domain
t = [0.5 1 2 3 4 5 6 7 9]';
p = [6 4.4 3.2 2.7 2 1.9 1.7 1.4 1.1]';

% Step 2: Use z-matrix the same as we do
z = [exp(t.*-1.5) exp(t.*-0.3) exp(t.*-0.05)];
a = (z'*z)\(z'*p);

fprintf('A = %f\n', a(1));
fprintf('B = %f\n', a(2));
fprintf('C = %f\n', a(3));

% Step 3: Plot graph
func = @(x) a(1)*exp(-1.5.*x) + a(2)*exp(-0.3.*x) + a(3)*exp(-0.05.*x);

plot(t, p, 'or');
hold on
fplot(func, [0 9]);