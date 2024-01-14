%% Practical Problems 13 Question 1

% Step 1: Welcome to ODEs guys. Let's create a system first
h = 0.5;
t = 0:h:3;
y = 1;
func = @(t, y) -y + t.^2;

% Step 2: Euler's Method | Slides 3
for i=1:length(t)-1  % เดียวจะ loop overflow เพราะ method มันจะเกิน
    y(i + 1) = y(i) + ( func(t(i), y(i)) .* h);
end

plot(t, y);