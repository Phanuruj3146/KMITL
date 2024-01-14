%% Practical Problems 13 Question 6

% Step 1: Setup
h = 0.1;
t = 0:h:10;
x1 = 1;
x2 = 1;
func1 = @(t,x1,x2) x2;
func2 = @(t,x1,x2) ((1 - x1.^2) .* x2) - x1;

for i = 1:length(t)-1
   x1(i+1) = x1(i) + h.*( func1(t(i) , x1(i) , x2(i)) );
   x2(i+1) = x2(i) + h.*( func2(t(i) , x1(i) , x2(i)) );
end
plot(t,x1)    % Original variable against time.
plot(x1,x2)   % Phase diagram of the 2 variables.