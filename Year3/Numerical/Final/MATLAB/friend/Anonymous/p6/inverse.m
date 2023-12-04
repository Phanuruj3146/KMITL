function [Ainv] = inverse(A)

if length(A) ~= length(A(:,1)) || det(A) == 0
    error("Invalid size")
end
Ainv = inv(A);
end

