%% Practical Problems 8 Question 6

% Step 1: Domain
x1 = [0 1 1 2 2 3 3 4 4]';
x2 = [0 1 2 1 2 1 2 1 2]';
y = [15.1 17.9 12.7 25.6 20.5 35.1 29.7 45.4 40.2]';
n = length(x1);
degree = 2;

% Step 2: Create fitted function
z = [ones(size(x1)) x1 x2];  % เป็น 2 ตัวแปร
a = (z'*z)\(z'*y);
disp('a =');
disp(a);

% Step 3: Calculate Std.Err and Correlation Coef.

% Correlation Coef. => r.^2 = st - sr / st
ybar = mean(y);
st = sum((y - ybar).^2);
sr =  sum((y - a(1) - a(2).*x1 - a(3).*x2).^2);
r2 = sqrt((st - sr) ./ st);

% Standard Error => sqrt( sr / n - (m+1) )
% n = number of data points
% m = degree of a polynomial
syx = sqrt(sr ./ (n - (degree + 1)));
fprintf("r = %f\n", r2);
fprintf("Syx = %f\n", syx);