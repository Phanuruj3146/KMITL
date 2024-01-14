%---Q4
% Input data
x = [1 2 3 4 5 6 7] ;
y = [3.6 1.8 1.2 0.9 0.72 1.5 0.51429] ;

% Number of data points
n = length(x) ;

% Use polyfit to a desired order
p = polyfit(x,y,n-1);

% Values to plot
X = linspace(min(x),max(x)) ;
Y = polyval(p,X);

% Plot
hold on;
plot(X,Y)

% % Do root finding to estimate x when y = 1.7
yy= 1.7;
root = roots([p(1) p(2) p(3) p(4) p(5) p(6) p(7)-yy]); % Adjust polynomial vector so it is shifted down by 1.7
root = root(imag(root)==0);
f = @(x) p(1)*x.^6 + p(2)*x.^5 + p(3)*x.^4 + p(4)*x.^3 + p(5)*x.^2 + p(6)*x.^1 + p(7);
% 
% % Find real root at correct location and both plot and display the result
plot(root,f(root),"xr");
scatter(x,y);
xlim([min(x), max(x)])