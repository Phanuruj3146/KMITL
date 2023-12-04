%% Practical Problems 9 Question 2

% Step 1: Data
x = [0 1 2.5 3 4.5 5 6];
y = [2 5.4375 7.3516 7.5625 8.4453 9.1875 12];

% Quadratic Newton Interpolation
% f(x) = b1 + b2(x-x1) + b3(x-x1)(x-x2)

% Step 2: Implement Newton's Interpolation
% https://www.mathworks.com/matlabcentral/fileexchange/7405-newton-s-interpolation
n = length(x);
fd(:,1) = y;
for i=1:n-1
    fd(i,1) = (y(i+1) - y(i)) / (x(i+1) - x(i));
end
for j=2:n-1
    for k=1:n-j
        fd(k, j) = (fd(k+1, j-1) - fd(k, j-1)) / (x(k+j) - x(k));
    end
end

b = fd(1,:);
b = [y(1) b];

% Step 3: Deal with function
% ข้อนี้ยากสัส
func = @(X) b(1) + b(2).*(X-x(1)) + b(3).*(X-x(1)).*(X-x(2)) + b(4).*(X-x(1)).*(X-x(2)).*(X-x(3)) + b(5).*(X-x(1)).*(X-x(2)).*(X-x(3)).*(X-x(4)) + b(6).*(X-x(1)).*(X-x(2)).*(X-x(3)).*(X-x(4)).*(X-x(5)) + b(7).*(X-x(1)).*(X-x(2)).*(X-x(3)).*(X-x(4)).*(X-x(5)).*(X-x(5));
scatter(x,y);
hold on
fplot(func,[0,6]);

solution = func(3.5);
fprintf('The estimated value of y at x = 3.5 is %f\n', solution);
plot(3.5, solution, 'xr');