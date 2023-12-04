%% Practical Problems 6.1 Question 12

% โจทย์: ใช้ Gaussian Elim. to find U (หรือก็คือ Row Reduction Form)
% ใช้ Formulae in lecture 6 to find L

% Step 1: Create an original matrix A
A = [1 -3 0; 0 1 3; 2 -10 2;];
disp('The original matrix is:');
disp(A);
disp('A can be written as the product of LU where:');

% Step 2: Find L (Lecture 6 หน้าที่ 40)
% Note: Replace Row by: Ri - kRj where Ri is Row ที่กำลังแก้ k = constant
% https://www.youtube.com/watch?v=a9S6MMcqxr4&ab_channel=LeahHoward

L = zeros(3);

L(1,1) = A(1,1);
A(1,:) = A(1,:) * 1/L(1,1);

L(2,1) = A(2,1);
A(2,:) = A(2,:) - L(2,1) * A(1,:);

L(3,1) = A(3,1);
A(3,:) = A(3,:) - L(3,1) * A(1,:);

L(2,2) = A(2,2);
A(2,:) = A(2,:) * 1/L(2,2);

L(3,2) = A(3,2);
A(3,:) = A(3,:) - L(3,2) * A(2,:);

L(3,3) = A(3,3);
A(3,:) = A(3,:) * 1/L(3,3);

% Note that while we were trying to get L, A was also manipulated
% The matrix A that was changing accordingly is U factorisation.
U = A;

% Re-create A
A = [1 -3 0; 0 1 3; 2 -10 2;];
disp('L =');
disp(L);
disp('U =');
disp(U);