%% Practical Problem 4 Question 2

rounding1 = [];
rounding2 = [];
rounding4 = [];
rounding8 = [];

roundErr1 = [];
roundErr2 = [];
roundErr4 = [];
roundErr8 = [];

n = 1;

while n < 101
    seq = pi.^n;
    rounding1(end+1) = round(seq, 1);
    rounding2(end+1) = round(seq, 2);
    rounding4(end+1) = round(seq, 4);
    rounding8(end+1) = round(seq, 8);
    n = n + 1;
end

absolute_value = @(indexes, something) pi.^indexes - something;

for i=1:length(rounding1)
    roundErr1(end+1) = absolute_value(i, rounding1(i));
    roundErr2(end+1) = absolute_value(i, rounding2(i));
    roundErr4(end+1) = absolute_value(i, rounding4(i));
    roundErr8(end+1) = absolute_value(i, rounding8(i));
end

T = table(roundErr1, roundErr2, roundErr4, roundErr8);
c1 = categorical(roundErr1);
c2 = categorical(roundErr2);
c4 = categorical(roundErr4);
c8 = categorical(roundErr8);

subplot(2, 2, 1);
plot(c1);
subplot(2, 2, 2);
plot(c2);
subplot(2, 2, 3);
plot(c4);
subplot(2, 2, 4);
plot(c8);