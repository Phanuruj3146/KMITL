% Define the function
f = @(x) (exp(x) .* sin(x)) ./ (1 + x.^2);

% Check the solution with the integral() function
real_ans = integral(f, 0, 2)
    
% Now compre with your Romberg function
adaptive_ans_1 = adaptive_quadrature(f, 0, 2, 0.01)

adaptive_ans_01 = adaptive_quadrature(f, 0, 2, 0.001)