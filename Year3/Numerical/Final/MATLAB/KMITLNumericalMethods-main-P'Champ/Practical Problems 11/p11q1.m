%% Practical Problems 11 Question 1

% Step 1: Integrate | Slide 6
func1 = @(x,y) x.^2 - 3.*(y.^2) + x.*(y.^3);
output = integral2(func1, 0, 4, -2, 2);
disp(output);

% Step 2: Integrate Function B
func2 = @(x,y) 10 - 4*x - 2*y;
output2 = integral2(func2, 0, 1, @(x) 3*x, @(x) 5-2*x);
disp(output2);