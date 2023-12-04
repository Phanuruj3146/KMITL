clear;
figure;

r = @(x) sin(x)*cos(2*x);
dr = matlabFunction(diff(sym(r)));

plot(linspace(-pi,pi,100), arrayfun(r,linspace(-pi,pi,100)));
hold on;

for start=linspace(-pi,pi,20)
    tolerance = 1e-5;
    
    x(1) = start;
    i = 1;
    e = 100;
    
    while e > tolerance
        x(i+1) = x(i) - r(x(i))/dr(x(i));
        e = abs(x(i)-x(i+1));
        i = i+1;
    end
    plot(x(end),0,'xr')
    clear x;
end
