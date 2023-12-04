%% Practical Problems 6.1 Question 8

% Pre-Req: nonlinearP6Q8.m

% Step 1: Plot Graph

func1 = @(x, y, z) ((3*x) - (cos(y*z)) - (3./2));
func2 = @(x, y, z) ((4*(x.^2)) - (625*(y.^2)) + 2*z - 1);
func3 = @(x, y, z) 20*z + exp(-x*y) + 9;

% We will use fimplicit3() since our systems are implicit and
% it's lie in 3D Space

fimplicit3(func1);
hold on
grid on
fimplicit3(func2);
hold on
grid on
fimplicit3(func3);

% Step 2: Find roots
myRoot = fsolve(@nonlinearP6Q8, [0 0 0]);
disp('The root are:');
fprintf('x: %f, y: %f, z: %f\n', myRoot(1), myRoot(2), myRoot(3));

% Step 3: Check our solution
sol1 = func1(myRoot(1), myRoot(2), myRoot(3));
sol2 = func2(myRoot(1), myRoot(2), myRoot(3));
sol3 = func3(myRoot(1), myRoot(2), myRoot(3));

disp(['Substituting into the first equation gives: ', num2str(sol1)]);
disp(['Substituting into the second equation gives: ', num2str(sol2)]);
disp(['Substituting into the third equation gives: ', num2str(sol3)]);