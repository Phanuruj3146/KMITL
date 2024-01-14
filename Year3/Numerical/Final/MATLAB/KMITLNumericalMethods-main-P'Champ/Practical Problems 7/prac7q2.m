%% Practical Problems 7 Question 2

% Calculate St and Sr
St = sum((y-mean_y).^2) ;
Sr = sum((y-a0-(a1.*x)).^2) ;

r1 = sqrt(abs(St-Sr)/St);

% Use these values to calculate the regression coefficient
r = ( (n * sum_xy) - (sum_x * sum_y) ) / ( sqrt( (n * sum_xx) - (sum_x)^2 ) * sqrt( (n * sum(y.^2)) - (sum_y)^2 ) ) ;
fprintf('The regression coefiicient, r, is: %f\n', r)
disp(r1)