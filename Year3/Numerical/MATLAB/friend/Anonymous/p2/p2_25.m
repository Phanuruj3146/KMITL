m = randi(10,4,4);
m(mod(m,2)==0) = 0;
disp(m);