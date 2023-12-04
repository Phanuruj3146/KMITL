fun = @(x) exp(x)*(cos(x))^2 - 2;
plot(linspace(0,5,100),arrayfun(fun,linspace(0,5,100)));
hold on;
h=1; % h = 1,2
x0=0;
for i= x0:h:5
    x = i;
    plot(fzero(fun, x),0, 'x');
end
