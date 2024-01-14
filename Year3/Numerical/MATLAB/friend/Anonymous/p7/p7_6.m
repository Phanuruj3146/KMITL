mass = [400,70,45,2,0.3,0.16];
metabolism = [270,82,50,4.8,1.45,0.97];

x1 = log(mass);
y1 = log(metabolism);

scatter(mass,metabolism);
hold on;
a = polyfit(x1,y1,1);

slope = a(1);
interc = a(2);

f = @(x) exp(interc) .* x.^(slope);

f(200)
plot(linspace(0,400),f(linspace(0,400)))
