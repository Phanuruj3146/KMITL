% 1.
myCell = {randi(100,3,4)};
myCell{end+1}= randi([-10,10],1,200);
myCell{end+1}= "Hello world!";

% 2.
r = input("Row:");
if ~(r > 0 && r < 4) || fix(r) ~= r
    disp("Invalid Row");
end
c = input("Column:");
if  ~(c > 0 && c < 5) || fix(c) ~= c
    disp("Invalid Column");
end
disp(myCell{1}(r,c));
mul = myCell{1}(r,c);

% 3.
v = myCell{2} .* mul;
myCell{end+1} = myCell{3};
myCell{3} = v;

% 4.
plot(myCell{2}, myCell{3})
