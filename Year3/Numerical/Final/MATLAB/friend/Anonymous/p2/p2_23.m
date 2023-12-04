function n = p2_23(v)
if length(v) < 2
    disp("Require more input");
else 
    n = length(v);
    sorted = sort(v);
    disp(sorted(end));
    disp(sorted(end-1));
end