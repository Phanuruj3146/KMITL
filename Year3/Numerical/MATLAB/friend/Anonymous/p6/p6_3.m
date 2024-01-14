m = [10,10,2;2,5,5;10,9,10];
a = cat(2,m,eye(3));
disp(rref(a));