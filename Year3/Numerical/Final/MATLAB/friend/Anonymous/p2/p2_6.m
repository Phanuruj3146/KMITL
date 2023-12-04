x = ["a","b","c","d","e","f"];
for i = 1:length(x)
    if mod(i,2) ~= 0
        disp(x(i));
        pause(2);
    end
end