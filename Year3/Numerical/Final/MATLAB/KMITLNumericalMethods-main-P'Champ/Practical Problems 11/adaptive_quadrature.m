function A = adaptive_quadrature(f,a,b,eps)
%{
Applies adaptive quadrature with Simpson's 1/3 rule from file simpson13.m.
For each subinterval [a,b] we take the midpoint, c. Then:

|S(a,b) - S(a,c) - S(c,b)| > 15eps

means that the subinterval must be further divided.

S is the Simpson's 1/3 rule function.
i_max is the maximum number of iterations allowed.
%}
A = step(f, a, b, eps);   % Call a recursive function to drill down into the subintervals.
end 

function A = step(f,a,b,eps)
% Recursive subfunction.
c = (a + b)/ 2;        % Midpoint of interval.
A1 = composite_simpson(f,a,b, 2) ;      % Call Simpson's 1/3 rule for n = 2.
A2 = composite_simpson(f,a,b, 4) ;        % Call Simpson's 1/3 rule for n = 4.
if  abs(A1 - A2) < eps*15  % Error criteria is met stop the iterations.
    A = A2;        % Return the result from that step.
else
    A = step(f, a,c, eps) + step(f, c,b, eps) ;        % Call the step function recursively for each subinterval side and return the result.
end         % Note for embedded functions we need to specify the end of each function manually.
end