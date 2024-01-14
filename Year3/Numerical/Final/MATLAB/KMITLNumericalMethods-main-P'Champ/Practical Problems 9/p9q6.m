%% Practical Problems 9 Question 6

% Step 1: Set up domain
x = linspace(-1, 1, 10);  % โจทย์สั่งมา
func = @(x)  1./ (1 + 25.*(x.^2));
y = func(x);

% Step 2: Use spline() which return interpolate vector
xx = linspace(min(x), max(x));
yy = spline(x, y, xx);

% Step 3: Plot
hold on
scatter(x, y);
plot(xx, yy);