%% Practical Problems 9 Question 7

% Step 1: Data | Slides 34
x = [0 2 4 7 10 12];
y = [20 20 12 7 6 6];
plot(x, y, 'rd');
hold on
grid on

% Step 2: Interpolate
% If we know the first derivertive and input = clampped
% If we make 3rd derivertive at 2nd and 2nd to last point = not
xx = linspace(0, 12);
yy_not = spline(x, y, 1.5);
yy_clamped = spline(x, [0 y 0], 1.5);  % ตาม condition above
yy_not_graph = spline(x, y, xx);
yy_clamped_graph = spline(x, [0 y 0], xx);
plot(xx, yy_not_graph, 'r');
plot(xx, yy_clamped_graph, 'b');