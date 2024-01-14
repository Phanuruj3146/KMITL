function xb = incsearch_stepsize(func,xmin,xmax,h)

x = xmin:h:xmax;
f = func(x);
nb = 0; xb = [];
for k=1:length(x)-1
    if f(k)*f(k+1)<=0
        nb = nb+1;
        xb(nb,1) = x(k);
        xb(nb,2) = x(k+1);
    end
end
if isempty(xb)
    disp('no bracket found')
else
    disp('number of brackets:')
    disp(nb)
end