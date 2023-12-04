f1 = @(x,y) 3.*x.^2 + 2.*y.^2 -25 ; 
f2 = @(x,y) 2.*x.^2 -y -15 ; 
fimplicit( f1 )
hold on
fimplicit( f2 )

% One possible solution is to create functions for each Jacobian entry
J11 = @(x,y) 6.*x ; % Partial derivative of top equation with respect to x
J12 = @(x,y) 4.*y ; % Partial derivative of top equation with respect to y
J21 = @(x,y) 4.*x ; % Partial derivative of bottom equation with respect to x
J22 = @(x,y) -1 ; % Partial derivative of bottom equation with respect to y

% Choose an initial guess for the method then make a loop with your own
% stopping criteria
% z = [-3, 1; -2.5 -1.5; 3 1; 2.5 -1.5]; % Choose inputs - advanced users use ginput()
z = [-3 -2.5 3 2.5; 1 -1.5 1 -1.5];
% x = zeros(100, 2) ; % Pre-allocate zeros (if from ginput() make x a multidimensional array)
tol = 0.0001 ;
disp('The roots are:')
for p = 1:size(z,2) % If using ginput() nest your while in a for loop
    k = 0; % Initialise while loop counter
    dif = 1; % Set to enter loop
    x = z(:, p); % Initial x-values
    while dif > tol
        k = k + 1; % Increas counter
        J = [J11(x(1,k), x(1,k)) J12(x(1,k), x(2, k)); J21(x(1,k), x(2,k)) J22(x(1,k), x(2,k))]; % Calculate Jacobian
        F = [f1(x(1,k), x(2,k)) ; f2(x(1,k), x(2,k))]; % Calculate system values
        x(:, k+1) = x(:, k) - J\F ; % Newton's method
        dif = sqrt(x(k+1) - x(k)); % Just use the length of the absolute error vector
    end
    plot(x(1,k+1), x(2,k+1), 'rO') % Plot the roots
    disp(x(:, k+1))
 end