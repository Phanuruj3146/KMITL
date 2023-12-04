clear;
w = @(x) x^3 - 6*x^2 + 10*x - 4;
roots([1,-6,10,-4])
roots = [];

while length(roots) < 3

    la = [0,1,3];
    lb = [1,2,4];

    a = la(length(roots)+1);
    b = lb(length(roots)+1 );

    if w(a) == 0 && ~ismember(a,roots)
        roots(end+1)=a;
        continue;
    end
    if w(b) == 0 && ~ismember(b,roots)
        roots(end+1)=b;
        continue;
    end

    if w(a)*w(b) > 0
        break 
    end


    while true
        x0 = (a+b)/2;
        if w(x0)*w(a)<0
            b = x0;
        elseif w(x0)*w(b)<0
            a = x0;
        end
        if abs(a-b)<1e-4
            roots(end+1)=a;
            break
        end
    end
end
    