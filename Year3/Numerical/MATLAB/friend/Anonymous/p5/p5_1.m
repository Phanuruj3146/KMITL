% x^5 - 10*x^3 + 21*x
p = [1,0,-10,0,21,0];
r = roots(p);
disp(r);

f = @(x) x^5 - 10*x^3 + 21*x;
disp(arrayfun(f,r));
