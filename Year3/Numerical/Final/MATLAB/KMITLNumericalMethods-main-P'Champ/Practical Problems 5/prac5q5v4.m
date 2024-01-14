%% Practical Problems 5 Question 5.4

i = 1;

% Function
h = @(x) x.^2 - x - exp(-x);

% Using fixed point iteration, but first, I want to plot graph to get idea
fplot(h, [-5 5]);
grid on

% Then we setup our criteria
approx_err = 1;
tolerance = 0.0001;
nTerms = 100;

g = @(x) 1 + ((exp(-x)) ./ x);

% Algorithm (Lecture 5 Slide 11)
% Step 1.) Pick initial value
x0 = 1;

% Step 2.) Calculate x1 = g(x0)
x = g(x0);

% Step 3.) Check that abs(gDIFF(x0)) < 1 or not
% เสริม: ดิฟไม่ต้องใช้คำสั่ง ใช้มือคำนวณแล้วมาพิมพ์เอา
gDiff = @(x) -(((x + 1)*exp(-x)) ./ (x.^2));
if gDiff(x0) < 1
    while approx_err > tolerance
        i = i + 1;
        if i > nTerms
            disp('Reach amount of iteration.');
        end
        x(end+1) = g(x(end));
        approx_err = abs(x(end) - x(end-1));
    end
else
    disp('Derivative larger than 1, stopping.');
end
disp(['Number of iteration: ' , num2str(i)]);
disp([x0 x]);