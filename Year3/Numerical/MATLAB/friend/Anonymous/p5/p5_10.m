clear;
m = @(x) cos(x^2/2)+cos(2*x);
dm = matlabFunction(diff(sym(m)));
ddm = matlabFunction(diff(sym(dm)));

clf;
plot(linspace(-pi,pi,100),arrayfun(m,linspace(-pi,pi,100)));
hold on;


tolerance = 1e-8;

for start=[-2,0,2]
    x(1)= start;
    i = 1;
    e(1)=100;
    while e(end)>(tolerance)
        x(i+1) = x(i) - dm(x(i))/ddm(x(i));
        e(i) = abs(x(i+1)-x(i));
        i = i+1;
    end
    p = plot(x(end),m(x(end)),'OR');
    p.MarkerFaceColor = [0 0 1];
    p.MarkerSize = 12;
    clear x;
    clear e;
    
end