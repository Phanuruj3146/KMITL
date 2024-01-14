%% Practical Problems 3 Question 13

% Prompt an input for user
sentence = input("Please enter a sentence:\n", "s");
alphabet = input("Please enter an alphabet:\n", "s");

% Split a sentence into a single word,
% then count and store the detect word in an array
array_word = {};
count = 0;
splitter = split(sentence);
for i=1:length(splitter)
    for j=1:length(splitter{i})
        if splitter{i}(j) == alphabet
            count = count + 1;
            array_word{end+1} = splitter{i};
        end
    end
end

% Categorize the store word
catter = categorical(array_word);

% Display an output of detecting word and amount of alphabet detect
displayer = categories(catter);
disp('--------------------')
disp('Word detected:');
disp(displayer);
disp(['Amount of alphabet show: ', num2str(count)]);