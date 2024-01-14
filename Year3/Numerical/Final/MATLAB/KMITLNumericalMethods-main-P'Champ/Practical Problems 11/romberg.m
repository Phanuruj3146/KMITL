function A = romberg(func, a, b, tol)
i_max = 1000;
n = 1;
I(1,1) = trapezium(func, a, b, n);  % เพราะ Romberg พื้นฐานมาจาก Richardson Extrapolation และ Richard ก็อิงมาจาก Trapz Rule อีกที
j = 0;
while j < i_max
    j = j + 1;
    n = 2^j;
    I(j+1, 1) = trapezium(func, a, b, n);
    for k=2:j+1
        jj = 2+j-k;
        I(jj,k) = ( ((4^(k-1)) * I(j+1 - (k-2), k-1)) - I(j- (k-2), k-1) )/ ((4^(k-1)) -1) ;% Romberg formula.
    end
    ea = abs((I(1, k) - I(2, k-1))/ I(1,k) ) * 100  ;        % Approximate percentage error.
    if ea < tol               % If statement that breaks the loop if the error is less than the tolerance.
        disp('error less than the tolerance. STOP!')
        break
    end
end
A = I(jj,k);               % Final output.
if j == i_max                  % If maximum iterations are reached display a warning to the user.
    disp('max iteration reached')
end