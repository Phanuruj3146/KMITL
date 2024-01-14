%% Practical Problems 6.1 Question 13

% Step 1: Grab our old questions

A = [1 -3 0; 0 1 3; 2 -10 2;];
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

U = A;

A = [1 -3 0; 0 1 3; 2 -10 2;];

% Step 2: Find roots (Lecture 6 Page 35)
b = [-5; -1; -20;];
y = L\b;

myRoot = U\y;

disp('The solution is:')
disp(myRoot);