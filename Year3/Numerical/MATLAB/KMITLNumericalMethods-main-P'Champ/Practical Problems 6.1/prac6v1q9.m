%% Practical Problems 6.1 Question 9

% Multidimensional Newton-Raphson = xi+1 = xi - J^-1 * F
% Note: J = [diff(f1,i/x1) ...];
% Note: J^-1 * F = J\F;
% Credits: P'Gunn ข้อนี้พี่ไม่ไหว

% Step 1: Plot Graph @(x, y)

func1 = @(x, y) (3*(x.^2)) + (2*(y.^2)) - 25;
func2 = @(x, y) (2*(x.^2)) - y - 15;

fimplicit(func1);
hold on
grid on
fimplicit(func2);

% Step 2: Find Root using Newton-Raphson
% From x(i+1) = x(i) - J\F
J11 = @(x, y) 6.*x;
J12 = @(x, y) 4.*y;
J21 = @(x, y) 4.*x;
J22 = @(x, y) -1;
tol = 0.0001;
% คู่อันดับในการเอาไปคำนวณ
z = [-3 -2.5 3 2.5; 1 -1.5 1 -1.5];  % Based on circle graph
for i=1:length(z)
    j = 0;
    dif = 1;
    % ค่าคู่อันดับที่เราจะเอาใช้ในแต่ละ iterate
    x = z(:, i);
    while dif > tol
        j = j + 1;
        % คำนวณหา Jacobian
        J = [J11(x(1,j), x(1,j)) J12(x(1,j), x(2, j)); J21(x(1,j), x(2,j)) J22(x(1,j), x(2,j))];
        % คำนวณค่า Function
        F = [func1(x(1,j), x(2,j)) ; func2(x(1,j), x(2,j))];
        % Newton's Method ในการหา Roots
        x(:, j+1) = x(:, j) - J\F ;
        % อัพเดท Error
        dif = sqrt(x(j+1) - x(j));
    end
    plot(x(1, j+1), x(2, j+1), 'ro');
    disp(x(:, j+1));
end