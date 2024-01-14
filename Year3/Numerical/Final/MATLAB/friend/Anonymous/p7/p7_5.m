x = [0.1,0.2,0.4,0.6,0.9,1.3,1.5,1.7,1.8];
y = [0.75,1.25,1.45,1.25,0.85,0.55,0.35,0.28,0.18];

clf;
% y = xalpha * e^(xbeta)
% ln(y/x) = ln(alpha) + xbeta
z = y./x;

hold on;
a = polyfit(x,log(z),1);
plot(linspace(-2.5,2),polyval(a,linspace(-2.5,2)))

beta = a(1);
alpha = exp(a(2));

figure;
scatter(x,y);
hold on;

f = @(x) x.*alpha.*exp(x.*beta);
plot(linspace(0,1.8), f(linspace(0,1.8)));