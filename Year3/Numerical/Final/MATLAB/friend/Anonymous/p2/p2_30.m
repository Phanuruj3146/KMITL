function ret = p2_30(n)
eq = @(x) 1/factorial(x);
e = 0;
for i= 0:n
    e = e + eq(i);
end
ret = e;
