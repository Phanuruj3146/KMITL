%% Practical Problems 12 Question 1

% Step 1: Data
x = [0.6 1.5 1.6 2.5 3.5];
y = [0.9036 0.3734 0.3261 0.08422 0.01596];

% Step 2: Fit to be 3rd Order Polynomial
p = polyfit(x, y, 3);
xx = linspace(min(x), max(x));
yy = polyval(p, xx);
plot(x, y, 'ro', xx, yy, 'b-');

% Step 3: Derivetive
dp = polyder(p);  % polyder Differentiate polynomial.
df = polyval(dp, x);

disp(p);
disp('The derivative is:')
disp(dp);
disp('The values of the derivatives at each x are:')
disp(df);