function area = test_simp(f, a, b, n)
%{
Implements Simpson's 1/3 rule:
A = (b-a)/(3*n)*(f(x0)+4*f(x1)+2*f(x2)+...+f(xn))
%}
% Check if n is even
if mod(n,2) == 0   
    h = (b - a) / n;
    x = a:h:b ;
    area = (h./3) .* ( f(a) + 4.*sum(f(x(2:2:end-1))) + 2.*sum(f(x(3:2:end-2))) + f(b) );
     
elseif n == 3 % If n = 3 use ...
    h = (b - a) / n ;
    x = a:h:b ;
    area = ( (b-a)./8 ) .* ( f(a) + 3.*f(x(2)) + 3.*f(x(3))+ f(b) );
    
elseif n > 3 % If n > 3 do the following:
    % If n is odd use the 1/3 rule for all subintervals except the last. For
    % the last use the 3/8 rule and tell the user.
    disp('Odd number of intervals entered. Combining 1/3 and 3/8 rule.')
    h = (b - a) / n;
    x = a:h:b ;
    area = ((h./3) .* ( f(a) + 4.*sum(f(x(2:2:end-4))) + 2.*sum(f(x(3:2:end-5))) + f(x(end-3)) )) + ( (b-x(end-3))./8 ) .* ( f(x(end-3)) + 3.*f(x(end-2)) + 3.*f(x(end-1))+ f(b) );
end