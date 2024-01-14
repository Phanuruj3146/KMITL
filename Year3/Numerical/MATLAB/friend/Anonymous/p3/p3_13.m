s = input("Your sentence: ", 's');
a = input("Alphabet to find: ", 's');

% s = "quick brown fox jumps over the lazy dog";
% a = "o";
ret = {};

words = split(s);
for i= 1:length(words)
    if contains(words(i), a)
        ret{end+1} = words(i);
    end
end

str = string(ret);
fprintf("The letter appears %d times\n", length(ret));
fprintf("The letter appears in \n");
disp(str);
