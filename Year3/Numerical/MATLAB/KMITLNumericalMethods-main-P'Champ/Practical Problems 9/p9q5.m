%% Practical Problems 9 Question 5

% Step 1: Data
v = [0.10377 0.11144 0.12547];
s = [6.4147 6.5453 6.7664];

% Step 2: Interpolate
% Linear Interpolate | Slides 1 | Matrix Form: p1x + p2
% We have to create matrix to solve | Slides 3
a_linear = [v(2) 1; v(3) 1;];
b_linear = s(2:3)';
p_linear = a_linear\b_linear;
val_linear = polyval(p_linear, 0.118);
fprintf('s_est_lin = %f\n', val_linear);

% Quadratic Interpolate
a_quad = [v(1).^2 v(1) 1; v(2).^2 v(2) 1; v(3).^2 v(3) 1];
b_quad = s(1:3)';
p_quad = a_quad\b_quad;
val_quad = polyval(p_quad, 0.118);
fprintf('s_est_quad = %f\n', val_quad);

% Inverse Interpolation
volume_linear = 6.45;

% Linear Case
aa_lin = [v(2) v(3)];
bb_lin = [s(2) s(3)];
pfit_linear = polyfit(aa_lin, bb_lin, 1);
root_linear = roots([pfit_linear(1) pfit_linear(2)-volume_linear]);
fprintf('v_est_lin = %f\n', root_linear);

% Quad Case
pfit_quad = polyfit(v, s, 2);
root_quad = roots([pfit_quad(1) pfit_quad(2) pfit_quad(3)-volume_linear]);
fprintf('v_est_quad = %f\n', root_quad);