function area = trapezium( f, a, b, n )
%{
Implements the composite trapezium rule:
A = (h/2)*(f(x0)+2*f(x1)+2*f(x2)+...+f(xn))
%}
format rational
% Step size
h = (b - a)/ n ;

format default
% x-values at which to evaluate function
x = a : h : b ;

% Vectorised formula for integral
area = (h/2) * ( f(a) + (2 * sum( f(x(2:end-1)) )) + f(b)) ;