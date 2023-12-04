a = [3,4;5,6];
b = [3;7];

x = inv(a)*b;
fprintf("x1 = %d\nx2 = %d\n",int64(x(1)),int64(x(2)));