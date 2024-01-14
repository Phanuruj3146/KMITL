function [root,n] = newt(r,dr,xi,tolerance)

iteration_times = 1;


while 1
    x=xi-r(xi)./dr(xi);
    d = abs(xi-x);
    if d<=tolerance
        break
    end
    iteration_times = iteration_times + 1;
    xi = x;
    

end
root = x;
n=iteration_times;