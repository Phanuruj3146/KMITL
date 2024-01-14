%% Practical Problem 3 Questions 12

powerOf = 0;
loop_bool = 0;

while ~isinf(loop_bool)
    disp(exp(powerOf));
    loop_bool = exp(powerOf);
    powerOf = powerOf + 1;
end

disp(['Maximum the power of natural expo is: ', num2str(powerOf - 1)]);