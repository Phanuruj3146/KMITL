function fixedPoint(g, gPrime, n, tol)
gList = [];
x0 = 1;
x = x0;
for i = 1:n
    gList(end+1) = x;
    xnew = g(x);
    if abs(xnew-x)<tol
        disp(['Number of iterations: ', num2str(i)]);
        disp(['x = ', num2str(gList)]);
        break;
    end
    if gPrime(x) > 1
        disp('error slope more than 1');
        break;
    end
    x = xnew;
end