x = [0,1,2.5,3,4.5,5,6];
F{1} = [2,5.4375,7.3516,7.5625,8.4453,9.1875,12];

% x = 3.5

f = @(i,j,y) (x(i)-x(j))/(y(i)-y(j));
k = 2; 

while true
for i = 1:length(F{k-1})-1
    F{k}(i) = f(i,i+1,F{k-1});
end

F{k}
if length(F{k}) == 1
    break
end
k = k+1;
end