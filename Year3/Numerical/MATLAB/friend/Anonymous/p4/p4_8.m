clear;
y = @(x) x^(3) - 6*x^2 + 10*x - 4;

bounds = [];
step = 0.1;
roots = 3;
start = 0;

while length(bounds) < roots*2
    if y(start)==0
        bounds(end+1) = start;
        bounds(end+1) = start;
    elseif y(start)*y(start-step)<0
        bounds(end+1) = start;
        bounds(end+1) = start-step;
    end
    start = start+step;
end

disp(bounds);