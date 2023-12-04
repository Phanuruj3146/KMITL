%% Practical Problems 12 Question 2

% Step 1: Data
t = [0 2 4 6 8 10 12 14 16];
s = [0 0.7 1.8 3.4 5.1 6.3 7.3 8 8.4];
p = polyfit(t, s, 7);
fplot(@(t) polyval(p, t), [0 16], 'b-');
hold on
plot(t, s, 'ro');

% Step 2: Centered Finite Differece @t = 10 | Reminder: ดิฟระยะทางได้ v ดิฟ v ได้ a
% cd = f(xi+1) - f(xi-1) / 2h + O(h.^2) | Slides 23
v_cd = (7.3 - 5.1) / 4;
v_cd2 = (-8 + 8*7.3 - 8*5.1 + 3.4) / 24;
fprintf('Standard CFD of v = %f and Improve CFD of v = %f\n', v_cd, v_cd2);

% Step 3: Forward Finite Differnce
v_fd = (7.3 - 6.3) / 2;
v_fd2 = (-8 + 4*7.3 - 3*6.3) / 4;
fprintf('Standard FFD of v = %f and Improve FFD of v = %f\n', v_fd, v_fd2);

% Step 4: Backward Finite Difference
v_bd = (6.3 - 5.1) / 2;
v_bd2 = (3*6.3 - 4*5.1 + 3.4) / 4;
fprintf('Standard BFD of v = %f and Improve FFD of v = %f\n', v_bd, v_bd2);

% Step 5: Centered Finite Difference Finding Acceleration
a_cd = ( 7.3 - 2*6.3 + 5.1 ) / 4;
a_cd2 = ( -8 + 16*7.3 - 30*6.3 + 16*5.1 - 3.4 ) / 12*(2^2);

% Step 6: Forward Finite Difference Finding Acceleration
