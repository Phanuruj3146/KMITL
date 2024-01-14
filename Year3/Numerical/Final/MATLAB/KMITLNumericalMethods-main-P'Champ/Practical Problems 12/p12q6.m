%% Practical Problems 12 Question 6

% Step 1: Create function
func = @(x, y) 3.*x.*y + 3.*x - x.^3 - 3.*(y.^2);
x = 1;
y = 1;
delX = 0.0001;
delY = 0.0001;

% Step 2: LET'S DO PARTIAL FUCKING DERIVERTIVE AND END THIS SHIT
fx = ( func(x + delX, y) - func(x - delX, y) ) ./ (2.*delX);
fy = ( func(x, y + delY) - func(x, y - delY) ) ./ (2.*delY);


fxx = ( ( func(x+delX, y) - 2*func(x,y) + func(x-delX,y) ) ) ./ (delX.^2);

disp(fx);
disp(fy);
disp(fxx);