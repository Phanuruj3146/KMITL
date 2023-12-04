%% Practical Problems 5 Question 2

% Receiving user input. In this case, we will insert root from Q1
ipt = input("Please insert your root: ");

% Create an anonymous function
% หรือก็คือ function ที่สามารถเรียกใช้ได้เลยไม่ต้องแคร์อะไรเท่าโดยเราใช้
% @() เป็นค่ารับ Input
px = @(x) x.^5 - 10*x.^3 + 21*x;

% Display an output, which suppose to be near 0 (near roots).
disp(px(ipt));