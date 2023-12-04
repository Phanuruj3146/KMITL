%% Practical Problems 8 Question 9

% From y = a0(1 - e^-a1*x) + error
% Step 1: Domain
x = [0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y = [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];

% Step 2: Find and estimate alpha beta
% fminsearch
% Find minimum of unconstrained multivariable function using derivative-free method
% Lecture 8 - Slide 28 - 30
a = fminsearch(@fit_power, [1,1], [], x, y);

% Step 3: Develop ap lot of our fit | สมการตามโจทย์
func = @(x) a(1).*x.*exp(a(2).*x);
plot(x, y, 'ro');
hold on
grid on
fplot(func, [0 1.8]);