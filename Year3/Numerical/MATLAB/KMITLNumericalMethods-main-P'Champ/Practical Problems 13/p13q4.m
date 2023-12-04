%% Practical Problems 13 Question 4

% Step 1: Setup system
h = 0.5;
t = 0:h:3;
y = 1;
func = @(t, y) -y + t.^2;

% Step 2: Same shit | Slides 21 ด้านขวามือ
for i=1:length(t) - 1
    k1(i) = func( t(i), y(i));
    k2(i) = func(t(i) + (1./2)*h, y(i) + (1./2)*k1(i)*h);
    k3(i) = func( t(i)  + ( (1/2)* h ) , ( y(i) + ((1/2) * k2(i) * h) )  );
    k4(i) = func( t(i) + h , y(i) + (k3(i) * h));
    y(i+1) = y(i) + (h/6)*( k1(i) + 2*k2(i) + 2*k3(i) + k4(i) );
end
plot(t, y);