x = [0,2,4,6,9,11,12,15,17,19];
y = [5,6,7,6,9,8,8,10,12,12];

xbar = mean(x);
ybar = mean(y);
n = length(x);

a1 = (n*(sum(x.*y)) - sum(x)*sum(y))/(n*sum(x.^2)-(sum(x)^2));
a0 = ybar - a1*xbar;

f = @(x) a0 + a1*x;

St = sum((y-ybar).^2);
Sr = sum((y-a0-a1*x).^2);

r = sqrt((St-Sr)/St);
disp(r);