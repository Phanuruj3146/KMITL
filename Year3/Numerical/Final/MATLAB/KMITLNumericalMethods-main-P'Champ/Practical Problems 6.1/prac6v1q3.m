%% Practical Problems 6.1 Question 3

% Augment the test matrix from question 2 with a 3 x 3 identity matrix
% then use Matlab rref() function to find it s reduced echelon form.

% Note: Augment Matrix อยู่ในฟอร์ม
% [A|B] = [a1 a2 a3; a4 a5 a6; a7 a8 a9; | b1; b2; b3;]

% Step 1: Create an augmented matrix
aug_matrix = [ test_matrix eye(3)];
disp('Augmented Matrix:');
disp(aug_matrix);  % จะสังเกตุว่าจะมี test matrix แล้วขั้นด้วย identity matrix

% Step 2: Make it in reduce row echelon form (rref)
rref_test_matrix = rref(aug_matrix);
disp('Reduced Row Echelon Form of Test Matrix:');
disp(rref_test_matrix);