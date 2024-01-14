%% Practical Problems 5 Question 6

function output = prac5q6(x0)
    % Setup + Init stopping criteria
    r = @(x) sin(x) * cos(2*x);
    approx_err = 1;
    tolerance = 0.0001;
    n = 100;
    i = 0;
    
    % Using Newton-Raphson Algorithm
    % Step 1: Pick initial value (as a user input)
    
    % Step 2: Calculate successive x values using:
    % x(i+1) = x(i) - (f(xi) ./ fDiff(xi));
    rDiff = @(x) (cos(x) * cos(2*x)) - ((2*sin(x)) * sin(2*x));
    x(1) = x0;
    
    % Calculate for x1 -> x1 = x0 - NEWTON RAPHSON
    while approx_err > tolerance
        i = i + 1;
        % Check if reach iteration max
        if i > n
            disp('Reach max iteration.');
            break
        end
        % Check if diff = 0. ถ้าดิฟได้ค่าเป็น 0 จะแปลว่าไม่มี slope
        % หรือลากตัดไม่ได้
        if abs(rDiff(x(end))) == 0
            disp('Derivative is 0. Stopping iteration.');
        end
        x(end+1) = x(end) - r(x(end)) / rDiff(x(end));
        approx_err = abs(x(end) - x(end-1));
    end
    disp('Root: ');
    disp(x(end-1));
    disp('i = ');
    disp(i);
    output = x(end-1);