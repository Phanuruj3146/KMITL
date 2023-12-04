syms x y z;

eqns = {
    3*x - cos(y*x) == 3/2,...
    4*x^2 - 625*y^2 + 2*z == 1,...
    20*z + exp(-x*y) == -9
    };
vpasolve(eqns{1}, eqns{2}, eqns{3}, [x y z]);


ans = fsolve(@f,[0,0,0]);

x = ans(1);
y = ans(2);
z = ans(3);

fprintf("The roots are:\n");
disp(ans);

% need to be fixed
sub_back = f(ans);
fprintf("Substituting into the first equation gives: %e\n", sub_back(1))
fprintf("Substituting into the first equation gives: %e\n", sub_back(2))
fprintf("Substituting into the first equation gives: %e\n", sub_back(3))
%

function func = f(x)
func = [
    (3*x(1) - cos(x(2)*x(1)) - 3/2); 
    (4*x(1)^2 - 625*x(2)^2 + 2*x(3) - 1);
    (20*x(3) + exp(-x(1)*x(2)) + 9)
    ];
end

