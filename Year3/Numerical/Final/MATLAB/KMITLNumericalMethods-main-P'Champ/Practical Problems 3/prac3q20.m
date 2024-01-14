%% Practical Problems 3 Question 20

% Create matrix B
B = randi([10, 50], 4, 7);
disp('Before insert B:');
disp(B);

% Keep every row in 1 and 2 as the same,
% then add a new transpose column in between,
% and add every row of the rest column.
B = [ B(:,1:2), [3 -2 4 8]', B(:,3:length(B)) ];
disp('After insert B:');
disp(B);