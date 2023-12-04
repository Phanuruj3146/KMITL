%% Practice Problems 5 Question 9

% The volume of liquid V in a holllow horizontal cylinder of radius R
% and length L is related to the depth of the liquid h by,
% V = [r^2cos^-1(r-h/r)-(r-h)sqrt(2rh-h^2)]L

% Determine h
% r = 2m
% L = 5m
% V = 8m

% Intro: ข้อนี้คือตัวอย่างที่ดีในการประยุกต์ใช้ Numerical Methods
% เพราะสมการในโจทย์คือสมการเชิงวิศวกรรมที่ไม่สามารถย้ายข้างหรือแก้ได้ด้วยคณิตศาสตร์ปกติ
% เราจึงต้องพึ่งวิธีการประมาณค่่าคำตอบ (Root Finding) แทน

% Step 1: From the question, it's a non-linear equation where
% F(x) ≠ 0 กล่าวคือ slope ไม่เท่ากับศูนย์ ภาษาชาวบ้านคือ diff แล้วแม่งไม่ 0
% แน่ๆ. So, we can use root approximation using fzero() to find the roots
% of non-linear equation. Firstly, we need to define our parameter first.

r = 2;
L = 5;
V = 8;

% Step 2: Define our equation (จัดรูปด้วย เพราะเราต้องการหา Root aka จับสมการ
% ข้างหนึ่ง = 0
myFunc = @(h) (( ((r.^2).*acos((r-h)./r)) - ((r-h).*(sqrt((2*r*h) - h.^2))) ) .* L - V);

% Step 3: Guess the possible roots by plot the graph
fplot(myFunc);

% Our guess will be x = 0.6
hold on
grid on
% fzero(fun,x0) tries to find a point x where fun(x) = 0. Nearest possible
% root
root = fzero(myFunc, 0.6);
plot(root, 0, 'ro');

% Step 4: Determine our h
myH = myFunc(root);
disp(['h = ', num2str(myH)]);