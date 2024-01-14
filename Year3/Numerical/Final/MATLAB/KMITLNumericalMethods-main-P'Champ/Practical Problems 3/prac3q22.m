%% Practical Problems 3 Question 22

% creates 2 anonymous functions, f1 and f2, for sin(x) and cos(x)
f1 = @(x) sin(x);
f2 = @(x) cos(x);

% 3rd anonymous function, f3 = (f1/f2) = sin(x)/cos(x) = tan(x))
f3 = @(x) sin(x)/cos(x);

% plot 3 functions different colours using subplots (domain -2π < x < 2π.)
subplot(1, 3, 1);
fplot(f1, [-2*pi 2*pi], 'r');
title('Subplot 1: sin(x)')

subplot(1, 3, 2);
fplot(f2, [-2*pi 2*pi], 'g');
title('Subplot 2: cos(x)')

subplot(1, 3, 3);
fplot(f3, [-2*pi 2*pi], 'b');
title('Subplot 3: tan(x)')