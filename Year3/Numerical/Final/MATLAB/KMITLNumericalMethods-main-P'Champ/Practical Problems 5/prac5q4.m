%% Practical Problems 5 Question 4

% Setup: From h = (b-a)/n,
h_inter = input('h: ');
% Therefore, we can split it like this
x_interval = 0:h_inter:5;

% Function
func = @(x) exp(x).*(cos(x).^2) - 2;

% Plot Graph
grid on
hold on
fplot(func, [0 5]);

% Find root using fzero
for i=1:length(x_interval)
    myRoot(i) = fzero(func, x_interval(i));
end

% Plot Root
plot(myRoot, 0, 'gx');