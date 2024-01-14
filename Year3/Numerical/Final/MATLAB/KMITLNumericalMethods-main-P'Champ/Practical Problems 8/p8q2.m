%% Practical Problems 8 Question 2

% Z-matrix formlation on slides 21-25.

% Step 1: Domain
x = [3 4 5 7 8 9 11 12]';
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]';

z = [ones(size(x)) x x.^2 x.^3];  % ตาม degree พหุนาม

% Step 2: Calculate
a = flipud((z'*z) \ (z'*y));