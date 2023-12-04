
function fixed_point(g,x0,n,tol)
syms 'x'
lol = ['x1=',num2str(x0)];
disp(lol)
for i =1:n
    x1=g(x0)
    if abs(x1-x0)<tol
        break
    end
    x0=x1;
    if diff(g(x1)) > 1
        error('error slope more than 1')

    end
end
end
