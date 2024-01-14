z = randi([20,50],6,1);

for i = 1:length(z)
    if z(i)>27 && z(i)<43
        z(i) = z(i)-12;
    end
end
