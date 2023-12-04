r = 0;
i = 1;
f = @(x) exp(x);

while r ~= Inf
    i = i+1;
    r = f(i);
end

disp(i-1);



