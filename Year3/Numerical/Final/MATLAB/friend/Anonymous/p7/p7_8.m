clf;
clear;
d = [2.4,1.5,2.4,1.8,1.8,2.9,1.2,3,1.2];
w = [2.9,2.1,2.3,2.1,1.8,2.7,1.5,2.9,1.5];

scatter(d,w)
hold on;
plot(linspace(0,3),polyval(polyfit(d,w,1),linspace(0,3)))

fprintf("%4.3f m\n",polyval(polyfit(d,w,1),1.8));
