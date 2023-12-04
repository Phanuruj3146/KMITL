%% Practice Problems 4 Question 6

% Convergence with Absolute Error Criterion
% Absolute Error is a numerator of New - Old/New

% The series will converge and it will get closer to tolerance (stopping).

% Variable
tolerance = 0.0001;
abs_err = 1;
n = 1;
Sn(1) = 4;

while abs_err > tolerance
    Sn(n+1) = (4.^(n + 1) / factorial(3*n + 1)) + Sn(n);
    % Absolute Error = Present Value - Estimation
    abs_err = abs(Sn(n+1) - Sn(n));
    disp(['Absolute error: ', num2str(abs_err)]);
    n = n + 1;
end

disp(['The number is converged to: ', num2str(Sn(end))]);
disp(['Number of terms: ', num2str(n-1)]);
