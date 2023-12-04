%% Practical Problems 7 Question 3

% Step 1: Define our domain
x = [0, 2, 4, 6, 9, 11, 12, 15, 17, 19];
y = [5, 6, 7, 6, 9, 8, 8, 10, 12, 12];

% Step 2: Find the best equation in 1 DEGREE
a = polyfit(x, y, 1);

% Step 3: Then plot our graph
% Plot our scatterplot
plot(x, y, 'or', 'MarkerSize', 8);
hold on
grid on
% Plot our line of best fit
X = linspace(0, 20);
Y = polyval(a, X);
plot(X, Y);