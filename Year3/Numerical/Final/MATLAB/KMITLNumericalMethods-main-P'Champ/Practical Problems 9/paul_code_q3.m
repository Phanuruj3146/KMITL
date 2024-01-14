%% THIS CODE IS DEDICATED TO PAUL H.

X = [1 2 3 5 6]
y = [4.75 4 5.25 19.75 36]

x = linspace(1, 6, 100);

r = [1 2; 3 4];
i = [1 2]

plot(x, lagrange_interpolate(x, X, y));
hold on;
scatter(X, y);
hold off;