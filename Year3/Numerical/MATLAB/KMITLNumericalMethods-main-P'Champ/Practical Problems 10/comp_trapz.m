%% Practical Problems 10 Question 5 | Slides 4-5

function output = comp_trapz(func, a, b, n)
h = (b-a)/n;
x = linspace(a, b, n);
fx = 2*sum(func(x(2:end-1)));  % ถ้าถามว่าทำไมเริ่มที่ 2 กูอิงตามสไลด์ และกูไม่รู้ทำไม
output = (h/2) * (func(a) + fx + func(b));
end