syms x y;
sol = vpasolve( ...
    3*x^2 + 2*y^2 == 25, ...
    2*x^2 - y == 15, ...
    [x y] ...
    );
disp(sol.x);
disp(sol.y);

% jacobian
F  = [3,2,0,0,-25;2,0,0,-1,-15];
J = jacobian([3*x^2 + 2*y^2 - 25, 2*x^2 - y -15],[x,y]);
J