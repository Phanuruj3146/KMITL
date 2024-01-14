%% Practical Problems 8 Question 3

% Step 1: Domain
x = [10 20 30 40 50 60 70 80];
y = [25 70 380 550 610 1220 830 1450];
n = length(x);
degree = 1;

% Step 2: Calculate
y_nonlinear = 2.5384.*x.^1.4359;
y_linear = 0.2741.*x.^1.9842;

sr_nonlinear = sum((y - y_nonlinear).^2);
syx_nonlinear = sqrt(sr_nonlinear ./ (n - (degree + 1)));

sr_linear = sum((y - y_linear).^2);
syx_linear = sqrt(sr_linear ./ (n - (degree + 1)));

fprintf('Syx_nonlinear = %f\n', syx_nonlinear);
fprintf('Syx_linear = %f\n', syx_linear);