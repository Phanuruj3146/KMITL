clf;
clear;
x = linspace(-2*pi,2*pi,100);
p = plot(x,cos(x));
p.LineWidth = 2;
p.Color = [0,0,0];
hold on;


for n = [2,4,8,16];
    n = 0:n;
    for i=1:100
        y(i) = sum(((-1).^n.*x(i).^(2*n))./(factorial(2*n)));
    end
    plot(x,y,'--R');
end