%% Practical Problems 10 Question 1

% Step 1: Create function
eqn = @(x) (2*(x.^5)) - (4*(x.^3)) - x + 1;

% Step 2: Integrate and display
output = integral(eqn, -2, 4);
display(output);