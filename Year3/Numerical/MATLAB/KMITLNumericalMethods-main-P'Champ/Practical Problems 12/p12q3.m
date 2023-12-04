%% Practical Problems 12 Question 3

% Step 1: Data
t = [0 25 50 75 100 125];
y = [0 32 58 78 92 100];

% Step 2: Finding velocity
v_fd = (32 - 0) / 25;
v_bd = (100-92) / 25;
v_cd = (y(3:6) - y(1:4)) ./ 50;

v_std = [v_fd v_cd v_bd];
disp(v_std);

% Step 3: Improved
vi_fd = (-58 + 4*32 - 3*0) / 50;
vi_fd2 = (-78 + 4*58 - 3*32) / 50;
vi_bd = (3*100 - 4*92 + 78) / 50;
vi_bd2 = (3*92 - 4*78 + 58) / 50;
vi_cd = (-y(5:6) + (8.* y(4:5)) - (8.*y(2:3)) + y(1:2)) ./ (12*25) ;

vi_std = [vi_fd vi_fd2 vi_cd vi_bd2 vi_bd];
disp(vi_std);