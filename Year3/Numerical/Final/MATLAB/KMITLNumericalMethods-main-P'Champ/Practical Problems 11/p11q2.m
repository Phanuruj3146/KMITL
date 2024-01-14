%% Practical Problems 11 Question 2

% Step 1: Integrate Function A
func1 = @(x,y,z) x.^3 - 2.*y.*z;
output1 = integral3(func1, -1, 3, 0, 6, -4, 4);
disp(output1);

% Step 2: Integrate Function B
func2 = @(x,y,z) 6.*(z.^2);
output2 = integral3(func2, 0, 5/2, 0, @(x) 10-4.*x, 0, @(x,y) 5-2.*x-y./2);
disp(output2);