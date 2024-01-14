%% Practical Problems 6.1 Question 4

% Note: Coefficient Matrix = Matrix ที่เอามาแค่ค่า coef
% Note 2: Inverse of a Matrix A = (1/abs(A)) dot adj(A)

% Step 1: Create the coeefficient matrix
coef_mat = [3 4; 5 6;];
b = [3; 7;];
disp('Coefficient Matrix:');
disp(coef_mat);

% Step 2: Check if det = 0, 
% because iff the determinant of the matrix A (detA) 
% is not zero, then this matrix has an inverse matrix
d = det(coef_mat);
disp(['Determinant of Coef Mat. = ', num2str(d)]);

% Step 3: Calculate the solution. X = A^-1 * b โดย b is coef คำตอบ
if d == 0
    disp('No inverse matrix.');
else
    Y = inv(coef_mat);
    x_sol = Y * b;
    fprintf('x1 = %f\n', x_sol(1));
    fprintf('x2 = %f\n', x_sol(2));
end