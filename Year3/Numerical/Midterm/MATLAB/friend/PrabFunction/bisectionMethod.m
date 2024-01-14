function root = bisectionMethod(func, a, b, tolerance, maxIterations)
    % Bisection Method for finding a root
    
    % Inputs:
    % - func: The function for which to find the root
    % - a: Left endpoint of the initial interval
    % - b: Right endpoint of the initial interval
    % - tolerance: Desired accuracy of the root
    % - maxIterations: Maximum number of iterations
    
    % Outputs:
    % - root: The approximated root of the function
    
    if func(a) * func(b) >= 0
        error('The function must have opposite signs at the interval endpoints.');
    end
    
    iteration = 0;
    
    while iteration < maxIterations
        iteration = iteration + 1;
        
        % Calculate midpoint of the interval
        c = (a + b) / 2;
        
        % Check if the midpoint is a root or within the desired tolerance
        if abs(func(c)) < tolerance || (b - a) / 2 < tolerance
            root = c;
            return;
        end
        
        % Update interval endpoints based on signs of function values
        if func(c) * func(a) < 0
            b = c;
        else
            a = c;
        end
    end
    
    % If maxIterations is reached without meeting the tolerance
    error('Bisection Method did not converge within the specified iterations.');
end


