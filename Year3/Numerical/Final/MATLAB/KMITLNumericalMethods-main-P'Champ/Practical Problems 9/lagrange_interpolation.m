function Y = lagrange_interpolation(x, X, y)
    Y = lagrange(x, X, 1:length(X)) * y';
end