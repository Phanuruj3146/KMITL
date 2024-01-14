%% Practical Problems 4 Question 3

% Plot the cosine function in a thick black line
x = linspace(-2*pi, 2*pi);
plot(x, cos(x), 'k-', 'LineWidth', 2);

% On the same graph, plot the Mac series approximation
hold on

% Declaring n-terms of summation we wanted to do
n = [2, 4, 8, 16];

% Loop n-terms
for i=1:4
    % All n to do the iteration
    all_n = 0:n(i);
    % Loop all x-values to do the summation (domain x = 100 values)
    for j=1:100 
        % Mac series
        y(j) = sum( ((((-1).^all_n)).*(x(j).^(2*all_n)))./factorial(2*all_n) );
    end
    % After end each summation, plot the graph.
    plot(x, y, '-');
end