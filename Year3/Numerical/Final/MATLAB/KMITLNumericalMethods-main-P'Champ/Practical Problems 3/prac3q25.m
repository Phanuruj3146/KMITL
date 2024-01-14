%% Practical Problems 3 Question 25

% create a function first

function prac3q25(func, vecx, vecy)
[x, y] = meshgrid(vecx, vecy);
z = func(x, y);
surf(z);
end