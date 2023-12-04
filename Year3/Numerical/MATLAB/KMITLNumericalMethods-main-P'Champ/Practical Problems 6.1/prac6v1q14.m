%% Practical Problems 6.1 Question 14

% Step 1: Ues lu() in Matlab's
A = [1 -3 0; 0 1 3; 2 -10 2;];
b = [-5; -1; -20;];
[L, U, P] = lu(A);

% Step 2: Find root
myRoot = inv(U) * inv(L) * P * b;
disp(myRoot);