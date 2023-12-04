%% Practical Problems 6.1 Question 6

% Step 1: Create system of linear equations of 3 variables
% Note = Mass-Balance Eqn. Idea is ขาเข้า = ขาออก
% สมการ 1: -130c1 + 30c2 + 0c3 = -500
% สมการ 2: 90c1 - 90c2 + 0c3 = 0
% สมการ 3: 40c1 + 60c2 - 120c3 = -500

coef_mat = [-130 30 0; 90 -90 0; 40 60 -120;];
b_mat = [-500; 0; -500;];

root_mat = coef_mat \ b_mat;

% Step 2: Display an answer
disp(['x1 = ', num2str(root_mat(1))]);
disp(['x2 = ', num2str(root_mat(2))]);
disp(['x3 = ', num2str(root_mat(3))]);