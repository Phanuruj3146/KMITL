function [df , err] = second_centered(f, p)
%{
The function should have 2 outputs and 2 inputs.

Inputs:
- Function whose derivative we desire
- Point to evaluate the derivative

Outputs:
- Value of centred difference approximation
- Relative approximate error

Take a small step size on either side of the point and calculate the centred 
appoximation then estimate the relative error by taking another smaller
step size and check using the relative iterative error formula:

|(better approx - worse approx)/better approx|
%}
tol = 0.001;    % Choose a default tolerance for your approximate error.

% Make a loop to change the step size so that the tolerance is met.
% (Give a maximum number of iterations)
h = 0.1;        % Initial step size to try.
err = 1;      % Intialise the error calculation since we don't have a value yet.
i_max = 1000;    % Set max iterations in case the calculation doesn't converge.
n = 1 ;
cd_worse = (f(p+h) - (2.* f(p)) + f(p-h)) ./ (h^2); % Calculate the approximation for the initial step size.
while err > tol &&  n < i_max      % While the error is too big and max iterations haven't been reached.
    n = n+1;
    h = h/2;    % Change the step size.
    cd_better = (f(p+h) - (2.* f(p)) + f(p-h)) ./ (h^2);    % Recalculate the approximation.
    err = abs((cd_better - cd_worse)/cd_better);
    cd_worse = cd_better;    % Update the worse approximation with the current one ready for the next loop.
    % Include an if-loop to display a warning in case there is no convergence before the maximum number of iterations
end

% Return the outputs and any messages to the user:
df = cd_better;