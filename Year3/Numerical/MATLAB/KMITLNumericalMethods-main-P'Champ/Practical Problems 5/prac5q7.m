%% Practice Problems 5 Question 7

% Use our Newton-Raphson function to find all roots on the interval [-pi, pi]
myX = linspace(-pi, pi);
rFunc = @(x) sin(x) * cos(2*x);

% Find all roots using NR-Function by passing in the initial value
% To 100 because linspace() will always produce 1x100 vector
for k=1:100
    % ในทางคณิตศาสตร์ y(x) หมายถึง output ของ x หรือก็คือ root
    % อันนี้ก็เหมือนกัน
    x = myX(k);
    y(k) = prac5q6(x);
end

% Plot graph
y = unique(y);
y(y < -pi | y > pi) = [];

fplot(rFunc, [-pi pi]);
grid on
hold on
plot(y, 0, 'rx');