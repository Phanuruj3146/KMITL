%% Practice Problems 4 Question 8

% Define the function as an anonymous function
f = @(x) x.^3 - 6.*x.^2 + 10.*x -4 ;
    
% Plot the function to see the interval where all 3 roots occur ( read about fplot() )
fplot(f)

% Set the step size
h = 0.1 ;

% Create the set of x-values in the desired range using the above step size
x = -5 : 0.1 : 5 ;

% Calculate the function values at each point
y = f(x) ;

% Find the indexes of where the sign changes (consider whether it should be < or <= 0)
% ind = find( y<0 );
ind =[];
roots=[];
if y(1)*y(2) < 0
    roots(1) = y(1);
    ind(1) = 1;
end
for k = 2: length(y)
    if y(k-1)*y(k) <= 0
        roots(end+1) = y(k-1);
        ind(end+1) = k-1;
    end
end

% If you have 2 indexes next to each other it means you probably exactly
% hit a root and so you must account for this in your code by removing one
% of them

% Estimate the roots based on your indexes (take an average like we did in the lecture notes)
temp =[];
for k = 2: length(ind)
    if x(ind(k)) - x(ind(k-1))  <= 0.1001
        temp(end+1) = k-1;
    end
end
ind(temp) = [];
roots(temp) = [];

disp('Root Approximation')
disp(x(ind)) 

disp('Function values at approximate roots')
disp(roots) % Display the roots

% Check the roots by plotting and substituting into the original function
hold on
plot(x(ind), roots, 'ro')
title('Incremental Search Method Root Approximation')
xlabel('x')
ylabel('y')
grid on