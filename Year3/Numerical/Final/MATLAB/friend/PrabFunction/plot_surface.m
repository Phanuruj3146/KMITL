function plot_surface(func, x_vals, y_vals)
    [X, Y] = meshgrid(x_vals, y_vals);
    Z = func(X, Y);
    surf(X, Y, Z);
end