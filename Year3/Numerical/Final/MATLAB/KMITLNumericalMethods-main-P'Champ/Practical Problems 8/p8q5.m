%% Practical Problems 8 Question 5

% Step 1: Domain
tval = 0:5:30;
t = [tval tval tval]';
c = [0 0 0 0 0 0 0 10 10 10 10 10 10 10 20 20 20 20 20 20 20]';
y = [14.6 12.8 11.3 10.1 9.09 8.26 7.56 12.9 11.3 10.1 9.03 8.17 7.46 6.85 11.4 10.3 8.96 8.08 7.35 6.73 6.20]';
disp(t);
% Step 2: Solve for a to create fitted function
z = [ones(size(t)) t c];  % เป็น 2 ตัวแปร
a = (z'*z)\(z'*y);

% Step 3: Create fitted function
fitted_func = @(temp, concent) a(1) + a(2).*temp + a(3).*concent;

% Step 4: Eval the value
fprintf('Oxygen estimated to be %f\n', fitted_func(20, 10));
