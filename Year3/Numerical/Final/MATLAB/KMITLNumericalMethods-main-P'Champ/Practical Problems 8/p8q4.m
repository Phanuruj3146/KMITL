%% Practical Problems 8 Question 4

% Step 1: Domain
temperature = 0:5:30;
c0 = [14.6 12.8 11.3 10.1 9.09 8.26 7.56];

% Step 2: Plot
plot(temperature, c0, 'ro');
hold on
grid on
p = polyfit(temperature, c0, 2);
xx = linspace(0, 30);
yy = polyval(p, xx);
plot(xx, yy);