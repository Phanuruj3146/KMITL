%% Practice Problems 5 Question 8

% ยังไม่เสร็จ 

% Setup
w = @(x) x.^3 - 6*x.^2 + 10*x - 4;

% Bisection Method Algorithm a.k.a Binary Search
% Step 1: Choose initial points a and b.
a = -100;
b = 10;

i = 0;
n = 100;
tolerance = 0.0001;
apx_err = 1;

% Then check if f(a)f(b) < 0. If not, must choose other points
if w(a) * w(b) < 0
    while apx_err > tolerance
        i = i + 1;
        
        if i > n
            disp('Reach max iteration.');
            break
        end
        
        % Step 2: Calculate halfway point, x0.
        x(i) = (a + b)/2;

        % Step 3: Check which one of f(a)f(xo) < 0 or f(b)f(xo) < 0,
        % Then choose appropriate next interval
        disp(w(a) * w(x(i)));
        disp(w(b) * w(x(i)));

        if w(a) * w(x(i)) < 0
            x(i+1) = (a )
        elseif w(b) * w(x(i)) < 0
            
        end
        apx_err = abs(x(end) - x(end - 1));
    end
else
    disp('f(a)f(b) >= 0. Please choose another pair of points.');
end
