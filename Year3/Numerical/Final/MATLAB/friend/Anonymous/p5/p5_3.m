q = @(x) -2*x^6 - 1.5*x^4 + 10*x + 2;
p = [-2, 0, -1.5, 0, 0, 10, 2];
r=(roots(p));

real = r(imag(r)==0);
disp(real);

sub = arrayfun(q,real);
disp(sub);

% cat(2,real,sub)

for i=1:length(real)
    fprintf("Root: %f \n Sub Back: %e\n", real(i),sub(i));
end