%% Practice Problems 4 Question 5

% Plot the true function from 0 to 5
figure(1);

x = linspace(0, 5);
expofunc = exp(x);
plot(x, expofunc);
title('True vs Approximation');
xlabel('x');
ylabel('y = e^x');
hold on

% Create another figure for errors
figure(2)
subplot(2, 1, 1);
title('Absolute Error')
xlabel('x');
ylabel('Abs.Error');
hold on
subplot(2, 1, 2);
title('Relative Error');
xlabel('x');
ylabel('Rel.Error');
hold on

% Maclaurin series
N = [1, 2, 4, 8, 16];

% Alike the previous example, we loop through n-values
for i=1:length(N)
    % Create a matrix for n-values in each iteration
    n = 0:N(i);
    % This time x values is 11
    for j=1:length(x)
        % Mac series
        y(j) = sum( (x(j).^n)./factorial(n) );
        abs_err(j) = abs(expofunc(j) - y(j));
        rel_err(j) = abs_err(j) / y(j);
    end
    % Swap plotting between graph and error
    figure(1);
    plot(x, y, '-');
    figure(2);
    subplot(2, 1, 1);
    plot(x, abs_err)
    subplot(2, 1, 2);
    plot(x, rel_err);
end