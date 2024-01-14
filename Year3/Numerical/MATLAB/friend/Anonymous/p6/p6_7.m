clf;
fimplicit(@(x,y) exp(x*y)-y^2);
hold on;
fimplicit(@(x,y) cos(x+y));

F = @(x) [exp(x(1)*x(2))-x(2)^2,cos(x(1)+x(2))];
for b = {[-3,1], [1,3], [1,1], [2,-1], [-1,-1], [-1,-4]}
    p = fsolve(F,b{:});
    scatter(p(1),p(2));
end