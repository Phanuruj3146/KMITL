%% Practical Problems 6.1 Question 2

% Create a 3 x 3 elementary matrix called E, 
% that adds 3 of the 1st row to the 3rd row of a matrix.
% Test it with a random 3 x 3 matrix of integers.

% Note: Elementary Matrix is a matrix that can be obtained from an
% identity matrix. หรือก็คือสามารถเอาเมทริกซ์เอกลักษณ์มาทำ operation
% จนมีตัวนี้ได้เช่น E = [1 0 0; 0 1 0; 3 0 1;] โดยได้มาจากการ row 1 ไปคูณ 3
% แล้วบวกกลับเข้าไปใน row ที่ 3

% Note 2: All operation we can do with Elementart Matrix are call:
% Elementary Row Operations which are the following:
% 1.) Row Swaps: Swap two rows
% 2.) Scalar Multiplication: Multiply by any scalar values
% 3.) Row Sum: Add a multiple of one row to another row

% Note to my CIE friends: ไม่ต้องตกใจ เรื่องนี้เราแม่งยังไม่ได้เรียน
% จริงๆ เราควรจะได้เรียนใน Linear Algebra ก่อน แต่วิชานี้เสือกเรียนเทอม 2

% Step 1: Create an identity matrix
E = eye(3);

% Step 2: Make E an identity matrix, I will change the third to [3 0 1];
E(3, 1) = 3;

% Step 3: Test the following matrix with random 3x3 integer matrix.
randMatrix = randi(10, 3);
disp('Random 3x3 Integers Matrix:');
disp(randMatrix);
test_matrix = E * randMatrix;
disp('Test Matrix:');
disp(test_matrix);