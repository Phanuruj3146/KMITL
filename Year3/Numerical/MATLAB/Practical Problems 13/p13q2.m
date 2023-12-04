%% Practical Problems 13 Question 2

% Step 1: Setup system
h = 0.5;
t = 0:h:3;
y(1) = 1;
func = @(t,y) -y + t.^2;

% Step 2: Use Huen's Method | Slides 12-13
for i = 1:length(t) - 1  % เช่นกัน -1 เพราะเดียว overflow
    y0(i) = y(i) + func(t(i), y(i)) * h;
    y(i+1) = y(i) + ( func(t(i), y(i)) + func(t(i+1), y0(i))) ./ 2 .* h;
end
plot(t, y);