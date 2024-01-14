function bounds = incrementSearch(f, h, range)
bounds = [];
for i = range(1):h:range(2)-h
    if f(i)==0
        bounds(end+1,1)=i;
        bounds(end,2)=i;
    elseif f(i)*f(i+h)<0
        bounds(end+1,1) = i;
        bounds(end,2) = i+h;
    end
end
end

