function ret = p2_29(tol)
f = @(x) 1/(2^x);
i = 1;
while true
if f(i) < tol
    ret=i;
    break;
end
i = i+1;
end
