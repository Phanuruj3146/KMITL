%{
The first step in solving this problem required you to linearise the
equation:

y = alpha*x^beta

Linearise this with respect to log10
%}

% Input the data
x = [ 400 70 45 2 0.3 0.16 ] ;
y = [ 270 82 50 4.8 1.45 0.97 ] ;

metabolism = 200;
    
% Create the data you need on the horizontal and vertical axes for the power equation

% log(y) = log(alpha) + beta(log(x))
X = log10(x) ;
Y = log10(y) ;
 
% Get the fitting equation coefficients using polyval/polyfit or your own formulae
linvar = polyfit(X, Y,1); %linvar = a
liny = polyval(linvar, X);
    
% Obtain alpha and beta from the coefficients
alpha = linvar(2) ; %lin a0
beta = linvar(1) ;  %lin a1

actual_alpha = 10.^(alpha);
actual_beta = beta; % this also stays the same

% Calculate the fitted data

%y = alpha*x^beta
f = @(x) actual_alpha .* (x).^actual_beta ;
linf = @(x) alpha + beta .* x; % y = a0 + a1 * x

xfit = linspace(min(x) , max(x)); 
yfit = f(xfit) ; 

% Plot both raw data and the fitting equation on the same graph
sgtitle('Prediction of Animal Metabolism')

subplot(1,2,1)

plot(xfit, yfit, 'b-') ;
grid on
hold on
plot(x ,y, 'b.', 'Markersize', 10) ;
plot(metabolism ,f(metabolism), 'bo') % prediction
title('Power Equation');

subplot(1,2,2)

plot(X, liny, 'r-');
grid on
hold on;
plot(X, Y, 'r.', 'Markersize', 10);
plot(log10(metabolism), linf(log10(metabolism)), 'ro'); % prediction
title('Linearised Power Equation');

fprintf('The fitting equation is y = %f x^( %f )\n', actual_alpha, actual_beta);
fprintf('Estimated metabolism of 200kg tiger is: %f (W)\n\n', f(metabolism));

fprintf("The power equation's correlation coefficient is %f \n", correlation_coefficient(x,y))
fprintf("The linearised power equation's correlation coefficient is %f \n\n", correlation_coefficient(X,Y))
    
% Calculate and display the predicted metabolism of a 200kg tiger 
...