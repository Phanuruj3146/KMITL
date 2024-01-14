clear;
clf;
range = 1:30;
x = pi.^(range);

oneDP = round(pi,1).^(range);
twoDP = round(pi,2).^(range);
fourDP = round(pi,3).^(range);
fourDP = round(pi,4).^(range);

hold on;
oneDP
plot(range,(abs(x-oneDP)));
plot(range,(abs(x-twoDP)));
plot(range,(abs(x-threeDP)));
plot(range,(abs(x-fourDP)));