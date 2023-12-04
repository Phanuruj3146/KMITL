x = [0,2,4,6,9,11,12,15,17,19];
y = [5,6,7,6,9,8,8,10,12,12];
scatter(x,y);
hold on;

a = polyfit(x,y,1);
% a0 = a(2);
% a1 = a(1);
% f = @(x) a1*x + a0;
% 
% plot(linspace(0,20),f(linspace(0,20)));

f = polyval(a,linspace(0,20));
plot(linspace(0,20),f);