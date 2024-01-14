%% Practical Problems 3 Question 24

%  Create an anonymous function, f5, that takes 3 inputs, 
% f, a and b, where f is another anonymous function

f5 = @(f, a, b) fplot(f, [a b]);
testFunc = @(x) sin(x);

% Test f5 by using any test function over whatever domain you like
% I will test sin(x) with domain -2pi < x < 2pi
f5(testFunc, -2*pi, 2*pi);