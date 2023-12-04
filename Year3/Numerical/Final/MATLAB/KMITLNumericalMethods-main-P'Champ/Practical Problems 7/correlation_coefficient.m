function r = correlation_coefficient(x,y)
r = (length(x) * sum(x .* y) - sum(x) * sum(y)) / (sqrt(length(x) * sum(x .^ 2) - (sum(x) .^ 2)) .* sqrt(length(x) .* sum(y .^ 2) - (sum(y) .^ 2)));