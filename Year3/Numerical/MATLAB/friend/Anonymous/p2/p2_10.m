y = randi(100,1,8);
for n = 1:length(y)
    if mod(n,2) == 0
        y(n) = 0;
    elseif mod(n,2) == 1
        y(n) = 1;
    end
end