%% Practical Problems 6.1 Question 5

% Same question from the previous one. But use left-division instead.

% Find solution using x = A \ b where A = coef.mat and B = coef.ans
coef_mat = [3 4; 5 6;];
b = [3; 7;];
x = coef_mat \ b;
disp(x);

% Hence, left-division is more faster. But left division operator is a
% bit more complicated than simply multiplying the inverse. So in general,
% it is more robust.