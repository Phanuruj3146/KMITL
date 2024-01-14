function [root,ea,iter] = bisect(func,xl,xu,es)
flag = true;
test = func(xl)*func(xu);
if test>0
    error('no sign change')
end

if test == 0
    flag = false;
    ea = 0;
    if func(xl) == 0
        root = xl;
    elseif func(xu) == 0
        root = xu;
    end
end

iter = 0;
xr=xl;
while flag
    xrold = xr;
    xr = (xl+xu)/2;
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr-xrold)/xr);
    end

    
    
    test = func(xl)*func(xr);
    if test<0
        xu = xr;
    elseif test > 0
        xl=xr;
    else
        ea=0;
 
    end

    root = xr;

    if ea<=es
        break
    end
end