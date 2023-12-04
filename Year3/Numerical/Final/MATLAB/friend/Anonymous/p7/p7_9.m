d = [100,200,400,800,1000,1500,2000,5000,10000,20000,42195];
m = [9.58,19.19,43.18,100.9,131.96,206.00,284.79,757.40,1577.53,3386.00,7377.00];
w = [10.49,21.34,47.60,113.28,148.98,230.07,325.35,851.15,1771.78,3926.60,8125.00];

x = linspace(0,45000);

subplot(2,1,1);
hold on;
scatter(d,m);
plot(x, polyval(polyfit(d,m,1),x));
fprintf("Predicted time for men is %10.4f s\n" ,polyval(polyfit(d,m,1),21097.5));

subplot(2,1,2);
hold on;
scatter(d,w);
plot(x, polyval(polyfit(d,w,1),x));
fprintf("Predicted time for women is %10.4f s\n" ,polyval(polyfit(d,w,1),21097.5));