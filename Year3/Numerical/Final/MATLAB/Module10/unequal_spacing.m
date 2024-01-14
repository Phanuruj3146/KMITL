function area = unequal_spacing(x,y)

%{
Implements the trapezium rule for unequally spaced data:
A = (h1/2)*(f(x0)+f(x1)) + (h2/2)*(f(x1)+f(x2)) + ...
%}
% Check if vectors are the same length and are ordered
if length(x) ~= length(y)
   % If vectors are different lengths display a message to the user
   disp('2 vectors are in different length')
else
    % If the vectors are unordered then sort the data and proceed:
    if ~(issorted(x))
        % Sort the data:
        [X, X_order] = sort(x) ;
        Y = y(X_order) ;
    else
        X = x;
        Y = y;
    end
    % Calculate the area:
    temp = zeros(1, length(X) - 1) ;
    for k = 1 : length(X) - 1
        h = X(k+1) - X(k) ; % Step sizes
        temp(k) = h * ((Y(k) + Y(k+1)) / 2 );    % Get the numerators (f(x0)+f(x1) etc.)
    end
    area = sum(temp) ; % Calculate the value
end
end
