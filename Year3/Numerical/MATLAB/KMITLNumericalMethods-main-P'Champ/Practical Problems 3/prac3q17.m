%% Practical Problems 3 Question 17

% Create matrix A alike question 16 (ในโจทย์บอก 13 แต่น่าจะเขียนผิด)
A = randi([0, 1], 4, 4);
e = [1 0 0 0; 0 0 0 1; 0 0 1 0; 0 1 0 0;];

disp('Before swap A:');
disp(A);

% If we do left-multiplication to swap row,
% we instead do right-multiplication to swap column
A = A*e;
disp('After swap A:');
disp(A);