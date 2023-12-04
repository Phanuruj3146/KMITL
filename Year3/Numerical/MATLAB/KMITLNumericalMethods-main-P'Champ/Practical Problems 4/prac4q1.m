%% Practical Problems 4 Question 1

n = 1;
answer = 0;
while answer ~= inf
    disp(['n-value:', num2str(n)]);
    disp(['Ans:', num2str(answer)]);
    disp('----------------');
    n = n + 1;
    answer = factorial(n);
end
disp(['The largest n-value that MATLAB can calculate is:', num2str(n-1)])