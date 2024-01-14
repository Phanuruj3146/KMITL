%% Practical Problems 7 Question 6

% Step 1: Define our domain
mass = [400, 70, 45, 3, 0.3, 0.16];
metabolism = [270, 82, 50, 4.8, 1.45, 0.97];
tiger_meta = 200;

% Step 2: Try fitting it in a power equation
x10 = log10(mass);
y10 = log10(metabolism);

linear_var = polyfit(x10, y10, 1);
linear_eqn = polyval(linear_var, mass);

alpha_intercept = linear_var(2);
beta_slope = linear_var(1);

actual_alpha = 10.^(alpha_intercept);

% Step 3: Define our graph
func_y = @(x) actual_alpha .* (x).^beta_slope;

% Plot the power equation
domain = linspace(min(mass) , max(mass));
plot(domain, func_y(domain), 'r') ;
grid on
hold on
plot(mass, metabolism, 'bo', 'Markersize', 8) ;
plot(tiger_meta ,func_y(tiger_meta), 'co') % prediction