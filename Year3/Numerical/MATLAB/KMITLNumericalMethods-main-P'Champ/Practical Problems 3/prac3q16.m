%% Practical Problems 3 Question 16

% Random 4x4 matrix A with values between 0 and 1 + (Matrix ทดสอบ)
A = randi([0, 1], 4, 4);
B = randi([0, 1], 4, 4);
e = [1 0 0 0; 0 0 0 1; 0 0 1 0; 0 1 0 0;];

disp('Before swap A:');
disp(A);

% มี 2 วิธี: 1.) ใช้คำสั่ง access index กับ 2.) ใช้ left-multiplication

% วิธีที่ 1
A([2, 4],:) = A([4, 2], :);
disp('After swap A:')
disp(A);

% วิธีที่ 2
% Swap the 2nd and 4th row, we can use elementary matrix to do that
% By doing left-multiplication, we can swap rows of an matrix
disp('Before swap B:')
disp(B);
B = e*B;
disp('After swap B:')
disp(B);

% Reference เผื่อใครอยากเข้าใจเพิ่ม:
% 1.) Permutation Matrix for Row/Column Swap
% https://www.youtube.com/watch?v=pCBRUW8kA9s&ab_channel=AlexFan
% 2.) Explain Permutation Matrix for Row Swap
% https://www.youtube.com/watch?v=WiPMuIf3Qeg&ab_channel=AlexFan