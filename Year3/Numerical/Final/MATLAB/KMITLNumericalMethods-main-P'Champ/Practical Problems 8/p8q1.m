%% Practical Problems 8 Question 1

% Step 1: From m*a = b.
% m = sum matrix
% a = a matrix
% b = sum xy matrix

x = [3 4 5 7 8 9 11 12];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];
degree = 3;

% จากตัวอย่าง lecture ทื่เป็น degree 2 แต่ในโจทย์เป็น degree 3
% ขยายขอบเขต matrix เป็น 4x4 แต่ fundamentals เหมือนเดิม

% m-matrix zone
n = length(x);
sumx = sum(x);
sumx2 = sum(x.^2);
sumx3 = sum(x.^3);
sumx4 = sum(x.^4);
sumx5 = sum(x.^5);
sumx6 = sum(x.^6);

m = [n sumx sumx2 sumx3; sumx sumx2 sumx3 sumx4; sumx2 sumx3 sumx4 sumx5; sumx3 sumx4 sumx5 sumx6];

% b-matrix zone
sumy = sum(y);
sumxy = sum(x.*y);
sumx2y = sum((x.^2) .* y);
sumx3y = sum((x.^3) .* y);

b = [sumy; sumxy; sumx2y; sumx3y;];

% Step 2: Find a
a = flipud(m \ b);  % flipud() = Flip Up Down ของ Matrix/Vector

% Step 3: Plot graph
plot(x, y, 'ro');
hold on
grid on

xx = linspace(3, 12);
yy = polyval(a, xx);  % Y = P(1)*X^N + P(2)*X^(N-1) + ... + P(N)*X + P(N+1)
plot(xx, yy);

% Step 4: Find std.err and correlation coef.

% Correlation Coef. => r.^2 = st - sr / st
ybar = mean(y);
st = sum((y - ybar).^2);
sr =  sum((y - polyval(a, x)).^2);
r2 = sqrt((st - sr) ./ st);

% Standard Error => sqrt( sr / n - (m+1) )
% n = number of data points
% m = degree of a polynomial
syx = sqrt(sr ./ (n - (degree + 1)));
fprintf("r = %f\n", r2);
fprintf("Syx = %f\n", syx);