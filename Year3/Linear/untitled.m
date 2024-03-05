A = [1 1 1 1 1 1;-1 -1 0 0 1 -1;-2 -2 0 0 3 1;0 0 1 1 3 -1;1 1 2 2 4 1];
[reduced_A, combine] = elementary_reduction(A);
disp(combine);
combine*A