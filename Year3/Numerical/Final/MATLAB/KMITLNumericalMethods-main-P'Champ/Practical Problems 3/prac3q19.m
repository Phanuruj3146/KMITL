%% Practical Problems 3 Question 19

% Create matrix B
B = randi([10, 50], 4, 7);

% Set every value of B that is both greater than 20 and less than 40 = 0
disp('Before change B:');
disp(B);

% We can use index accessing to change it within one line of code
B(B > 20 & B < 40) = 0;
disp('After change B:');
disp(B);

% The single ampersand & is the logical AND operator. 
% The double ampersand && is again a logical AND operator that employs short-circuiting behaviour. 
% Short-circuiting just means the second operand (right hand side) is evaluated only when
% the result is not fully determined by the first operand (left hand side)
% 
% A & B (A and B are evaluated)
% 
% A && B (B is only evaluated if A is true)