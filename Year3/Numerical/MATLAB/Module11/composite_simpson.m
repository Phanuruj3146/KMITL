function output = composite_simpson(func, a, b, n)
if mod(n, 2) == 0 && n > 1
    h = (b-a)/n;
    x = a:h:b;
    output = (h/3) * ( func(a) + 4*func(x(2:2:end-1)) + 2*sum(func(x(3:2:end-2))) + func(b) );
elseif n == 3
    h = (b-a)/n;
    x = a:h:b;
    output = ( (b-a)/8 ) * ( func(a) + 3*func(x(2)) + 3*func(x(3)) + func(b) );
elseif n > 3
    disp('Odd number of intervals entered. Combining 1/3 and 3/8 rule.');
    h = (b-a)/n;
    x = a:h:b;
    output = ((h/3) * ( func(a) + 4*func(x(2:2:end-4)) + 2*sum(func(x(3:2:end-5))) + func(x(end-3)) )) + ( (b-x(end-3))/8 ) * ( func(x(end-3)) + 3*func(x(end-2)) + 3*func(x(end-1))+ func(b) );
end