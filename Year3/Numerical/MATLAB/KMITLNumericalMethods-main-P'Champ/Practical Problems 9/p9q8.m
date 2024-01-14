%% Practical Problems 9 Question 8

% Step 1: Data | Slides 45
x = 1:3;
y = 1:2;
z = [10 15 30; 30 35 50];

% Step 2: Interpolate
xx = linspace(min(x), max(x), 7);
yy = linspace(min(y), max(y), 4);
[X, Y] = meshgrid(xx, yy);
zint = interp2(x, y, z, X, Y); 