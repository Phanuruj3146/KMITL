clear;
x = [3,4,5,7,8,9,11,12];
y = [1.6,3.6,4.4,3.4,2.2,2.8,3.8,4.6];

mx = [  sum(x.^0), sum(x.^1), sum(x.^2), sum(x.^3) ;
        sum(x.^1), sum(x.^2), sum(x.^3), sum(x.^4) ;
        sum(x.^2), sum(x.^3), sum(x.^4), sum(x.^5) ;
        sum(x.^3), sum(x.^4), sum(x.^5), sum(x.^6) ;
     ];
my = [sum(y);sum(y.*x);sum(y.*x.^2);sum(y.*x.^3)];

a = mx\my;
a = flip(a,1);
disp("a = ")
disp(a);

hold on;
scatter(x,y);
plot(linspace(3,12), polyval(a,linspace(3,12)))
plot(linspace(3,12), polyval(mean(y),linspace(3,12)) )


sr = sum((y-polyval(a,x)).^2);
st = sum((y-mean(y)).^2);
r = sqrt((st-sr)/st);
disp("r = ")
disp(r);

syx = sqrt(sr/(length(x)-(length(a)-1 + 1)));
disp("syx = ")
disp(syx);