%% Practical Problems 13 Question 8

% Step 1: Setup
d = 0.25;
e = 1;
g = 9.81;

h = [6 5 4 3 2 1 0];
a = 10.^4 .* [1.17 0.97 0.67 0.45 0.32 0.18 0];

p = polyfit(h, a, 6);  % n-1
func = @(t, h) ( - (pi .* d.^2 ) ./ ( 4 .* ( polyval(p,h) ) )  .* (sqrt(2.*g.*(h+e))));

% Euler's to solve ODEs
i = 0;
hstep = 0.1;
t(1) = 0;
while 1
    i = i + 1;
    t(i+1) = t(i) + hstep;    % Increase time
    h(i+1) = h(i) + (func( t(i), h(i)) .* hstep);    % Use Euler's method or something else.
    if h(end) < 0 || imag(h(end)) > 0     % If the solution becomes negative or not real break the loop.
        break
    end
end
plot(t,h)
disp(['Time to drain is approximately t = ',num2str(t(end)),' seconds or ',num2str(t(end)/3600),' hours.'])