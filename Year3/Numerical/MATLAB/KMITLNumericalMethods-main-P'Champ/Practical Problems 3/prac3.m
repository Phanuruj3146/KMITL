%% Practical Problem 3 Questions 1 to 4
myCell = { randi([10 50],3,4), linspace(-10,10, 200), "Thanapat E" };
a = input("Please enter a row in a 3x4 matrix.\n");
b = input("Please enter a column in 3x4 matrix.\n");

if isa(a, "double") && isa(b, "double")
    if (a > 0 && a < 4) && (b > 0 && b < 5)
        disp(['Current vector: ', num2str(myCell{2})]);
        disp(['Scalar multiplier: ', num2str(myCell{1}(a, b))]);
        new_vector = myCell{1}(a, b) .* myCell{2};
        disp(['New vector: ', num2str(new_vector)]);
        myCell{end+1} = myCell{end};
        myCell{end-1} = new_vector;
        disp('Current cell:');
        celldisp(myCell);
    else
        disp("Please enter a valid indexes for the matrix.")
    end
end

plot(myCell{2}, myCell{3});