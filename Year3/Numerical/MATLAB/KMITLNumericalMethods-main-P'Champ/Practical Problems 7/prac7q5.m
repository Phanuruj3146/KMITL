%% Practical Problems 7 Question 5

% Note: y = alpha*x*exp(beta*x)

% Step 1: Define our domain
x = [0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y = [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];

% Step 2: Linearized our function
func = log(y./x);
a = polyfit(x, func, 1);
Y = polyval(a, x);

% Note: y = a * x(e^bx)
% Linearized form: ln(y) = ln(alpha) + beta * x
% Therefore: a(2) = ln(alpha) | Intercept, and a(1) = beta | Slope
alpha = a(2);
beta = a(1);
alpha4 = exp(alpha);

% Step 3: Plot graph
subplot(1,2,1);
title('Actual Function');
func_y = @(x) alpha4 .* x .* exp(beta .* x);
X = 0.1:0.05:1.8;

plot(X, func_y(X), 'r');
hold on
grid on
plot(x, y, 'bo', 'MarkerSize', 8);

subplot(1, 2, 2);
title('Linearized Function');
plot(x, Y, 'b.');  % Linearized function
hold on
grid on
plot(x, func, 'r-.');

% Step 4: Define the fitting eqn.
disp('The fitting equation is:');
fprintf('y = %f x*exp(%f x)\n', alpha4, beta);  % As define
fprintf('The correlation of coefficient is: %f\n', correlation_coefficient(x, y));