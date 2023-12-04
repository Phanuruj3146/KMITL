%% Practical Problems 6.1 Question 7

% Prerequisite: nonlinearP6Q7 for holding system of eqns.

% Step 1: Plot a graph
func1 = @(x, y) (exp(x*y)) - (y.^2);
func2 = @(x, y) cos(x + y);

fimplicit(func1);
hold on
grid on
fimplicit(func2);

% Step 2: Try to find roots
x0 = -2;
% สร้าง Matrix ไว้เก็บคำตอบ
myRoot = zeros(6, 2);
for i=1:6
    % กรอกคำตอบเข้า Column 1
    myRoot(i,:) = fsolve(@nonlinearP6Q7, [x0+i, 0.5]);
end

x0 = -2;
for k=1:6
    % กรอกคำตอบเข้า Column 2
    myRoot(k+6,:) = fsolve(@nonlinearP6Q7, [x0+k, 1.2]);
end

plot(myRoot(:,1), myRoot(:,2), 'ro');