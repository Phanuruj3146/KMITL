%% Practical Problems 12 Question 5

% Step 1: Setup Function
v = @(t) 2.*t ./ sqrt(1 + t.^2);
p = 5;

% Calculate difference approximation | Slides 19
D_worse = (v(p + 0.5) - v(p)) / 0.5;
D_better = (v(p+0.25)-v(p)) / 0.25;
% Use Richardson Extrapolation
D_improved = (4*D_better-D_worse) / 3;  % Slide 27

% Step 2: Get exact solution to calculate error
syms t
vv =(2*t)/sqrt(1+t^2);
dv = diff(vv);
dv= matlabFunction(dv);
D_actual = dv(p);

err_worse = abs((D_actual - D_worse) / D_actual)*100;
err_better = abs((D_actual - D_better) / D_actual)*100;
err_improved = abs((D_actual-D_improved) / D_actual)*100;

disp(D_worse);
disp(D_better);
disp(D_improved);
disp(err_worse);
disp(err_better);
disp(err_improved);