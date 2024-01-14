function l = lagrange(x, X, i)
    top = repmat((x' - repmat(X, length(x), 1)), 1, 1, length(i));
    bottom =  X(i)' - repmat(X, length(i), 1);
    bottom = reshape(bottom', [1, length(X), length(i)]);

    res = bsxfun(@rdivide, top, bottom);
    result = reshape(res(~(isnan(res) | isinf(res))), [length(x) length(X) - 1 length(i)]);
    l = reshape(prod(result, 2), length(x), length(i));
end