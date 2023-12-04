A = ["a","b","c";"d","e","f";"g","h","i"];
for i = 1:length(A)
    for j = 1:length(A)
        if i-j == 0 || i+j == length(A)+1
            disp(A(i,j));
            pause(3);
        end
    end
end