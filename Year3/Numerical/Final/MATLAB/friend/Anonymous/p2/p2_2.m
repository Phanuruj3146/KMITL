subplot(2,1,1);
x = linspace(-2*pi,2*pi,100);
plot(x,sin(x));
ylabel('sin(x)');
subplot(2,1,2);
plot(x,cos(x));
ylabel('cos(x)');