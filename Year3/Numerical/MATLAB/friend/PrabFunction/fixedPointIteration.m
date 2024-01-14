function root = fixedPointIteration(g, initialGuess, tolerance, maxIterations)
    % Fixed-Point Iteration method for finding a root
    
    % Inputs:
    % - g: The iterative function (rearranged equation)
    % - initialGuess: Initial guess for the root
    % - tolerance: Desired accuracy of the root
    % - maxIterations: Maximum number of iterations
    
    % Outputs:
    % - root: The approximated root of the function
    
    x0 = initialGuess;
    iteration = 0;
    
    while iteration < maxIterations
        iteration = iteration + 1;
        
        % Update the root approximation using the fixed-point formula
        x = g(x0);
        error = abs(x - x0);
        fprintf('Iteration %d: x = %.8f, Error = %.8f\n', iteration, x, error);

        % Check for convergence (change in root) and error handling
        if error < tolerance
            fprintf('Converged to a root: %.8f\n', x);
            root = x;
            return;
        end

        if isinf(error) || isinf(x) || isnan(error) || isnan(x)
            fprintf('Iteration diverged due to infinite value and nan.\n');
            return;
            
        end

        if diff(g(x)) > 1
            fprintf('Error: Slope of the function greater than 1.');
            return;
        end
        
        x0 = x;
    end
    
    % If maxIterations is reached without meeting the tolerance
    fprintf('Fixed-Point Iteration method did not converge within the specified iterations.');
end