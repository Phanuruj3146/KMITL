%% Practical Problems 7 Question 4

% Step 1: Define our domain
T = [-40, 0, 40, 80, 120, 160];
p = [6900, 8100, 9350, 10500, 11700, 12800];
V = 10;

kelvin = T + 273;

n = (1000 / (14.006747 * 2) );

% Step 2: Find our LOB
a = polyfit(kelvin, p, 1);
disp(a);
% Step 3: Plot graph
plot(kelvin, p, 'bo', 'MarkerSize', 8);
hold on
grid on
Y = polyval(a, kelvin);
plot(kelvin, Y);

% Step 4: Find Universal Gas Constant, R
R = a(1) * V / n;
fprintf('R is approximately %f\n', R);