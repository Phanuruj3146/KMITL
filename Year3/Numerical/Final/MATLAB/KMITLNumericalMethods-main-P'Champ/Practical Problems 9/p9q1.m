%% Practical Problems 9 Question 1

% Step 1: Data
x = [0 1.8 5 6 8.2 9.2 12];
y = [26 16.415 5.375 3.5 2.015 2.54 8];

% Step 2: Plot and interpolate
subplot(2, 1, 1);
plot(x, y, 'bo');
hold on
xlabel('x');
ylabel('y');
title('Interpolating Polynomials');
xx = linspace(0, 12);

% Linear Interpolate | Slides 1 | Matrix Form: p1x + p2
% We have to create matrix to solve | Slides 3
x_linear = x(1:7);
a_linear = [x_linear(1) 1; x_linear(2) 1; x_linear(3) 1; x_linear(4) 1; x_linear(5) 1; x_linear(6) 1; x_linear(7) 1];
b_linear = y(1:7)';
p_linear = a_linear\b_linear;
func_linear = p_linear(1).*xx + p_linear(2);  % Slides 3
y_linear = p_linear(1).*3 + p_linear(2);
plot(xx, func_linear, 'r');

% Quadratic Interpolate
a_quad = [x(1).^2 x(1) 1;
    x(2).^2 x(2) 1;
    x(3).^2 x(3) 1;
    x(4).^2 x(4) 1;
    x(5).^2 x(5) 1;
    x(6).^2 x(6) 1;
    x(7).^2 x(7) 1;];
b_quad = y(1:7)';
p_quad = a_quad\b_quad;
func_quad = (p_quad(1).*(xx.^2)) + p_quad(2).*xx + p_quad(3);
y_quad = (p_quad(1).*(3.^2)) + p_quad(2).*3 + p_quad(3);
plot(xx, func_quad, 'g');

% Cubic Interpolate
a_cubic = [x(1).^3 x(1).^2 x(1) 1;
    x(2).^3 x(2).^2 x(2) 1
    x(3).^3 x(3).^2 x(3) 1
    x(4).^3 x(4).^2 x(4) 1
    x(5).^3 x(5).^2 x(5) 1
    x(6).^3 x(6).^2 x(6) 1
    x(7).^3 x(7).^2 x(7) 1];
b_cubic = y(1:7)';
p_cubic = a_cubic\b_cubic;
func_cubic = p_cubic(1).*xx.^3 + p_cubic(2).*xx.^2 + p_cubic(3).*xx + p_cubic(4);
y_cubic = p_cubic(1).*3.^3 + p_cubic(2).*3.^2 + p_cubic(3).*3 + p_cubic(4);
plot(xx, func_cubic, 'b');

% Step 3: Compare estimated value
subplot(2, 1, 2);
xlabel('Polynomial Degree');
ylabel('Estimated y at x = 3');
title('Degree vs. Estimated Value');
xx2 = 1:7;
y_value = [y_linear y_quad y_cubic 0 0 0 0];
plot(xx2, y_va);