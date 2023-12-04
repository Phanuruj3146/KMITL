x = [0 1.8 5 6 8.2 9.2 12];
y = [26 16.415 5.375 3.5 2.015 2.54 8];

% find x = 3
% metric
xlinear = [1.8 1;5 1];
ylinear = [16.415;5.375];
a = xlinear\ylinear;
disp(a);
fprintf("linear y = %f\n\n", a(1)*3 + a(2));

xquadratic = [0 0 1; 1.8^2 1.8 1; 5^2 5 1];
yquadratic = [26;16.415;5.375];
a = xquadratic\yquadratic;
disp(a);
fprintf("quadratic y = %f\n\n", a(1)*3^2 + a(2)*3 + a(3));

xcubic = [0 0 0 1; 1.8^3 1.8^2 1.8 1; 5^3 5^2 5 1; 6^3 6^2 6 1];
ycubic = [26;16.415;5.375;3.5];
a = xcubic\ycubic;
disp(a);
fprintf("cubic y = %f\n\n", a(1)*3^3 + a(2)*3^2 + a(3)*3 + a(4));

polyfit(x,y,6)
% newton