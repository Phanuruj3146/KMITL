% syms V r h L;
% eqn = V == (r^2*acos((r-h)/r)-(r-h)*sqrt((2*r*h)-h^2))*L;
% V = 8;
% r = 2;
% L = 5;
% eqn = subs(eqn);
% S = vpasolve(eqn,h);

V = 8;
r = 2;
L = 5;
f = @(h) (r^2*acos((r-h)/r)-(r-h)*sqrt((2*r*h)-h^2))*L - V ;
fplot(f);
x = NR(f, 1);
disp(x(end));
