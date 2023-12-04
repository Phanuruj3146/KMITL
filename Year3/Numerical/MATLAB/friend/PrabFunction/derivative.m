function function_derivative = derivative(f,x)
    function_derivative = @(f, x) (f(x +  1e-6) - f(x)) / 1e-6;
end