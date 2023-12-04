%% Practical Problems 9 Question 4

% Step 1: Data | Slides 22 - 26
x = [1 2 3 4 5 6 7];
y = [3.6 1.8 1.2 0.9 0.72 1.5 0.51429];

n = length(x);

p = polyfit(x, y, n-1);

xx = linspace(1, 7);
yy = polyval(p, xx);

% Step 2: Plot
plot(xx, yy);
hold on
grid on

% Step 3: Root finding | Inverse Interpolation
y_question = 1.7;
root = roots([p(1) p(2) p(3) p(4) p(5) p(6) p(7)-y_question]);
root = root(imag(root) == 0);

func = @(x) p(1).*x.^6 + p(2).*x.^5 + p(3).*x.^4 + p(4).*x.^3 + p(5).*x.^2 + p(6).*x + p(7);

plot(root, func(root), 'xr');
scatter(x, y);
xlim([1, 7]);