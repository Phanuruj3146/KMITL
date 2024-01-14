clear;

tolerance = 1e-4;
f = @(n) 4^(n+1)/factorial(3*n+1);
i = 1;
x(1)=f(0)+f(1);
e = abs(f(0)-x(1));
fprintf("Absolute error is: %e\n",e);
while e > tolerance
    i=i+1;
    x(i) = x(i-1)+f(i);
    e = abs(x(i)-x(i-1));
    fprintf("Absolute error is: %e\n",e);
end

fprintf("The sum has converged to %f\n",x(end));
fprintf("The number of terms required is %d\n",i);
