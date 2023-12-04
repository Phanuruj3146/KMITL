%% Practical Problems 3 Question 18

% Create matrix A (ในโจทย์ไม่ได้บอกแต่น่าจะหมายถึง 2 ข้อที่ผ่านมา)
A = randi([0, 1], 4, 4);
disp('Before change A:');
disp(A);

% We can use index accessing to change it within one line of code
A(A > 0.5) = 7;
disp('After change A:');
disp(A);