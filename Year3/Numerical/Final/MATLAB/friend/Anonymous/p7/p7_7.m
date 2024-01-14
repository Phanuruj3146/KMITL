clear;
clf;

c = [0.5,0.8,1.5,2.5,4];
k = [1.1,2.5,5.3,7.6,8.9];

% k = km*c / (cs+c)
% 1/k = cs/km*c + c/km*c = cs/km * 1/c + 1/km

a1 = polyfit(1./c,1./k,1);

km1 = 1/a1(2);
cs1 = a1(1)*km1;
f1 = @(x) km1.*x./(cs1+x);

scatter(c,k);
hold on;
plot(linspace(0,4),f1(linspace(0,4)));

% k = km*c^2 / (cs+c^2)
% 1/k = cs/km*c^2 + c^2/km*c^2 = cs/km * 1/c^2 + 1/km

a2 = polyfit(1./(c.^2),1./k,1);

km2 = 1/a2(2);
cs2 = a2(1)*km2;
f2 = @(x) km2.*(x.^2)./(cs2+(x.^2));
plot(linspace(0,4),f2(linspace(0,4)));

disp(f2(2))
