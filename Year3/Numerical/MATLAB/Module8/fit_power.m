function Sr = fit_power(a, x_data, y_data)
% a = [alpha, beta]
F_power = a(1)*x_data.*exp(a(2).*x_data);
Sr = sum((y_data - F_power).^2);