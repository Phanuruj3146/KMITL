clear;
h = @(x) x^2 - x - exp(-x);

g{1} = @(x) -exp(-x) + x^2;
g{2} = @(x) sqrt(exp(-x)+x);
g{3} = @(x) -log(x^2 - x);
g{4} = @(x) 1 + ((exp(-x))/x);

dg{1} = matlabFunction(diff(sym(g{1})));
dg{2} = matlabFunction(diff(sym(g{2})));
dg{3} = matlabFunction(diff(sym(g{3})));
dg{4} = matlabFunction(diff(sym(g{4})));

x0 = 1;
t = 1e-4;
formula = 2;

x(1) = x0;
e = 100;
i = 1;

error = false;

while e > t
    if abs(dg{formula}(x(i)))>=1
        error = true;
        break
    end
    i = i+1;
    x(i) = g{formula}(x(i-1));
    e = abs(x(i)-x(i-1));
end

if error
    disp("Derivative larger than 1, stopping...")
    disp("Number of iteration:")
    disp(i-1)
else
    disp("Number of iteration:")
    disp(i-1);
    disp(x);
end 
