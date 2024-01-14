%% Practical Problems 5 Question 10

% Determione the LOCATION of turning points. Plot the figure and mark it
% with thick, large, red circles with blue faces.

% Note: A turning point is a point of the graph where the graph changes 
% from increasing to decreasing (rising to falling) 
% or decreasing to increasing (falling to rising) a.k.a Slope เปลี่ยน.

% Note 2: To find the location of turning points on a function, 
% find the first derivative of the function, and then set the result to 0
% a.k.a y = 0

% Step 1: ข้อนี้ให้หา turning point. So, diff equation ซะ

% ทวนความรู้นิดนึง ดิฟ sin -> cos -> -sin -> -cos -> sin
% และอย่าลืมดิฟไส้แล้วเอาไปคูณ (Chain Rule)

m = @(x) cos((x.^2) ./ 2) + cos(2*x);
mDiff = @(x) (-x*sin((x.^2) ./ 2)) - (2*sin(2*x));
fplot(mDiff, [-pi pi], 'b');
grid on

% Step 2: Find the possible turning point where y = 0 (use fzero)
% We estimated that roots are at -2, 0, and 2
root1 = fzero(mDiff, -2);
root2 = fzero(mDiff, 0);
root3 = fzero(mDiff, 2);

fprintf('Root 1: %f, Root 2: %f, Root 3: %f\n', root1, root2, root3);

% Step 3: Then check if whether the following nearest roots fits the
% principle with our differential equation
check1 = mDiff(root1);
check2 = mDiff(root2);
check3 = mDiff(root3);

fprintf('Check 1: %f, Check 2: %f, Check 3: %f\n', check1, check2, check3);

% Step 4: They're fits the principle! ลองเช็คด้วยการแทน mDiff(-3 ถึง -1) ดู
% จะเห็นการเปลี่ยนแปลงของ Slope ที่ชัดเจน. Then, we plot the answer
all_roots = [root1 root2 root3];

hold on
% Plot MAIN equation. Not the differentiate one.
fplot(m, [-pi pi], 'r');
plot(all_roots, m(all_roots), 'o', 'MarkerSize', 5, 'MarkerEdgeColor', 'r', ...
    'MarkerFaceColor', 'b');
legend('Diff.Func.', 'Main Func.');