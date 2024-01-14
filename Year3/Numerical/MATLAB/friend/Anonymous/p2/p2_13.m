z = randi([20,50],6,1);

for i = 1:length(z)
    if i==2 || i==4 || i==5
        z(i) = z(i)*2;
    end
end