clear;
x = linspace(0,5,100);
y = {exp(x)};
p = plot(x,y{1});
p.Color = [0,0,0];
p.LineWidth = 2;
hold on;
title("True vs. Approximations")
xlabel("x")
ylabel("y=e^x")

for n = [1,2,4,8,16]
    n = 0:n;
    for i=1:100
        g(i) = sum(x(i).^(n)./factorial(n));
    end
    y{end+1} = g;
    plot(x,g);
end
legend("True","n=1","n=2","n=4","n=8","n=16");

figure;
subplot(2,1,1);
title("Absolute Error");
ylabel("Absolute Error");
xlabel("x");
hold on;
for i=2:6
    plot(x, abs(y{1}-y{i}))
end
legend("n=1","n=2","n=4","n=8","n=16");

subplot(2,1,2);
title("Relative Error");
ylabel("Relative Error");
xlabel("x");
hold on;
for i=2:6
    plot(x, (abs(y{1}-y{i})./y{1}))
end
legend("n=1","n=2","n=4","n=8","n=16");
