%% Practical Problems 7 Question 1

% Note: y = a0 + a1x + e
% a0 = y-intercept, x = slope, e = error where
% e = y - a0 - a1x (มาจากการย้ายข้างสมการ)

% Note 2: Least Squares = sum(yi - a0 - a1xi).^2

% Step 1: Setup Variable (Ref: Lecture 7 No.9-14)
x = [0, 2, 4, 6, 9, 11, 12, 15, 17, 19];
y = [5, 6, 7, 6, 9, 8, 8, 10, 12, 12];
xy = x.*y;
xx = x.^2;

mean_x = ( (sum(x)) ./ length(x));
mean_y = ( (sum(y)) ./ length(y));
sum_x = sum(x);
sum_y = sum(y);
sum_xy = sum(xy);
sum_xx = sum(xx);
n = length(x);

a1 = ((n * sum_xy) - (sum_x * sum_y)) / (n * sum_xx - (sum_x)^2);
a0 = (mean_y - (a1*mean_x));

% Step 2: Create a best fit
x_fit = linspace(0, 20);
y_fit = @(x) (a0 + a1.*x);

% Step 3: Plot
plot(x, y, 'bo', 'MarkerSize', 8);
hold on
grid on
plot(x_fit, y_fit(x_fit), 'r');
legend('Data', 'Best Fit');