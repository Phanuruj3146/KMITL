function A = romberg_der(f,x0,tol)
%{
Applies Romberg differentiation using the centred difference function mycentdiff.m (see template).
          k=1     k=2      k=3      k=4   ...    (kth level of Romberg integration).
j=1:    D(1,1) | D(1,2) | D(1,3) | D(1,4) ...
j=2:    D(2,1) | D(2,2) | D(1,3) |        ...
j=3:    D(3,1) | D(3,2) |           |        ...
j=4:    D(4,1) |           |           |        ...
...
j represents the level of step size.

We set i_max to be the maximum level of step sizes before the
algorithm gives up and displays a warning to the user.
%}
i_max = 8;   % Your choice of maximum iterations.
h = 1;        % Initialise domain partitions.
I(1,1) = centered(f,x0, h) ;  % Use the trapezium rule with n = 1. Call your nested function at the bottom for this.
j = 0;        % Initialise j counter.
while j<i_max
    j = j+1;
    h = h/2;
    I(j+1,1) = centered(f,x0, h) ;    % Calculate the next jth partition using the trapezium rule.
    for k = 2 : j+1
        jj = 2+j-k;   % A new j-variable for the next level of Romberg integration (next k).
        I(jj,k) = ( ((4^(k-1)) * I(j+1 - (k-2), k-1)) - I(j- (k-2), k-1) )/ ((4^(k-1)) -1) ;% Romberg formula.
    end
    ea = abs((I(1, k) - I(2, k-1))/ I(1,k) ) * 100 ;         % Approximate percentage error.
    if ea < tol               % If statement that breaks the loop if the error is less than the tolerance.
        disp('error less than the tolerance. STOP!')
        break
    end
end
A = I(jj,k);               % Final output.
if j == i_max                  % If maximum iterations are reached display a warning to the user.
    disp('max iteration reached')
end
end


function df = centered(f, p, h)
df = (f(p+h) -  f(p-h)) ./ (2*h);
end