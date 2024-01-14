%% Practice Problems 4 Question 7

% Convergence with Relative Error Criterion
% Relative Error = New - Old/New

tolerance = 0.0001;
rel_err = 1;
n = 1;
S(1) = 4;

while rel_err > tolerance
    S(n+1) = (4.^(n + 1) / factorial(3*n + 1)) + S(n);
    % Relative Error criteria
    rel_err = abs((S(end) - S(end-1))/S(end));
    disp(['Absolute Error: ', num2str(rel_err)]);
    n = n + 1;
end

disp(['The sum has converged to: ', num2str(S(end))]);
disp(['The number of terms required: ', num2str(n-1)]);