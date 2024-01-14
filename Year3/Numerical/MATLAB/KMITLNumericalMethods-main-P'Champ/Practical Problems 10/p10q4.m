%% Practical Problems 10 Question 4

% Step 1: Data
x = [0 4 6 8 12 16 20];
p = [4 3.95 3.89 3.8 3.6 3.41 3.3];
A = [100 103 106 110 120 133 150];

% Step 2: Determine the mass
y = p.*A;
output = trapz(x, y);
disp(output);