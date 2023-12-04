%% Practical Problems 13 Question 3

% Step 1: Setup system
h = 0.5;
t = 0:h:3;
y = 1;

eps = 0.1;
Ea = 1;  % Erorr approx

func = @(t, y) -y + t.^2;

% Step 2: Do shit | Slides 10
for i = 1 : length(t) - 1
    y0(i) = y(i) + func(t(i), y(i)) * h  ; % First predictor slope.
    counter = 0;   % Set counter in case Heun's method doesn't converge.
    while abs(Ea) > eps
        counter = counter + 1;
        y(i+1) = y(i) + ( func(t(i), y(i)) + func(t(i+1) , y0(i))) ./ 2 .* h ;   % Corrected slope.
        Ea = abs((y(i+1) - y0(i)) / y(i+1)) * 100;  % Approximate error.
        y0(i) = y(i+1);    % Set predictor slope to be the corrected slope.
        if counter > 1000    % If too many iterations display a warning and break.
            disp('too much iteration')
            break
        end
    end
    Ea = 1 ;   % Reset approximate error.
end
plot(t, y);