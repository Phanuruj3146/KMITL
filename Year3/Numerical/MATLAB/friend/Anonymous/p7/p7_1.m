clf;
x = [0,2,4,6,9,11,12,15,17,19];
y = [5,6,7,6,9,8,8,10,12,12];
scatter(x,y);
hold on;

xbar = mean(x);
ybar = mean(y);
n = length(x);

a1 = (n*(sum(x.*y)) - sum(x)*sum(y))/(n*sum(x.^2)-(sum(x)^2));
a0 = ybar - a1*xbar;

f = @(x) a0 + a1*x;
plot(linspace(0,20),f(linspace(0,20)));