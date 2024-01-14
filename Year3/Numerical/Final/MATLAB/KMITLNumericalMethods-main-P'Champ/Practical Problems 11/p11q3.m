%% Practical Problems 11 Question 3

% Step 1: Setup Function to apply random sampling | Slides 40
% From last problem
func = @(x,y,z) x.^3 - 2.*y.*z;  
n = 1000;
xmin = -1;
xmax = 3;
x = xmin + rand(1, n) * (xmax-xmin);

ymin = 0;
ymax = 6;
y = ymin+rand(1, n) * (ymax-ymin);

zmin = -4;
zmax = 4;
z = zmin+rand(1, n) * (zmax-zmin);

% Step 2: Calculate the estimated integral value
A = func(x,y,z) .* ( (xmax-xmin) * (ymax-ymin) * (zmax-zmin) );  % กว้าง * ยาว * สูง

% Step 3: Calculate the avg. of A for each n
avg = zeros(1,n);
for i=1:n
    avg(1,i) = A(i);
    avg(1,i) = sum(avg) / i;
end

% Step 4: Plot graph
plot(1:n, avg, 'b-');
mean(avg);
f = @(x,y) x.^2 - 3.*y.^2 + x.*y.^3;
myans = MonteCarloIntegration(0,4,-2,2,f,0.00001);  % MonteCarlo2Variable