%% Practical Problems 6.1 Question 10

% Note: Echelon Form = A matrix that
% 1.) The first non-zero element in each row is 1
% 2.) Each leading entry is in a column to the right
% 3.) Rows with all zero elements, if any, are below rows having non-zero

% Step 1: Reduce 3x3 matrix to echelon form
A = [1 -3 0; 0 1 3; 2 -10 2;];

% (R1*2) - R3 -> New R3 
R1x2 = [A(1) * 2, A(4) * 2, A(7) * 2];
A(3) = R1x2(1) - A(3);
A(6) = R1x2(2) - A(6);
A(9) = R1x2(3) - A(9);

% R(2*-6) - R3 -> New R3
R2xMIN6 = [A(2) * 4, A(5) * 4, A(8) * 4];
A(3) = R2xMIN6(1) - A(3);
A(6) = R2xMIN6(2) - A(6);
A(9) = R2xMIN6(3) - A(9);
disp(A);