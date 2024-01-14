function root = newtonRaphson(initial_func, initialGuess, tolerance, maxIterations)
    % Newton-Raphson method for finding a root of a function
    
    % Inputs:
    % - func: The function for which to find the root
    % - derivFunc: The derivative of the function
    % - initialGuess: Initial guess for the root
    % - tolerance: Desired accuracy of the root
    % - maxIterations: Maximum number of iterations
    
    % Outputs:
    % - root: The approximated root of the function
    
    syms x_sym;
    x_sym = initial_func(x_sym);
    x_prime_sym = diff(x_sym, 1);
    x_prime = matlabFunction(x_prime_sym);

    x0 = initialGuess;
    iteration = 0;
    
    for iteration = 1:maxIterations
        
        fx = initial_func(x0);
        dfx = x_prime(x0);
        
        % Newton-Raphson formula
        x = x0 - (fx) / (dfx);

        error = abs(x - x0);

        % Check if the change in root is within the tolerance
        if error <= tolerance
            root = double(x);
            fprintf('Converged to root: %.8f\n', x0);
            return;
        end

        x0 = x;
    end
    
    % If maxIterations is reached without meeting the tolerance
    error('Newton-Raphson method did not converge within the specified iterations.');
end
