%% Practical Problems 9 Question 3

% Step 1: Data
x = [1 2 3 5 6];
y = [4.75 4 5.25 19.75 36];
sum = 0;
graph = 0;

% Step 2: Lagrange Interpolation | Slides 20 | Implement ยากชิบหาย
xx = linspace(1, 6);
for i = 1:length(x)
    u = 1;
    l = 1;
    for j = 1:length(x)
        if j ~= i
            u = u .* (xx - x(j));
            l = l * (x(i) - x(j));
        end
    end
    graph = graph + u / l * y(i);
end
scatter(x,y);
hold on
plot(xx, graph);

x_question = 4;  % Observe here
for i=1:length(x)
    u = 1;
    l = 1;
    for j = 1:length(x)
        if j ~= i
            u = u .* (x_question - x(j));
            l = l * (x(i) - x(j));
        end
    end
    sum = sum + u / l * y(i);
end
fprintf('The estimated function value at x = 4 is %f\n', sum);
plot(x_question, sum, 'xr');