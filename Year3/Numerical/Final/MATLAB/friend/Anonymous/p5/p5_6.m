clear;

r = @(x) sin(x)*cos(2*x);
dr = matlabFunction(diff(sym(r)));

start = input("Initial guess: ");
tolerance = 1e-4;

x(1) = start;
i = 1;
e = 100;

while e > tolerance
    x(i+1) = x(i) - r(x(i))/dr(x(i));
    e = abs(x(i)-x(i+1));
    i = i+1;
end

disp("root:");
disp(x(end));
disp("n:");
disp(i-1);
