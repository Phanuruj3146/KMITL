%% Practical Problems 3 Questions 5 to 10

% Create a field and value for a struct
field1 = 'Name'; value1 = {'Harry', 'Georgia', 'Elizabeth'};
field2 = 'Age'; value2 = {36, 21, 78};
field3 = 'Height'; value3 = {170, 181, 158};
field4 = 'Mass'; value4 = {80, 70, 65};

myStruct = struct(field1, value1, field2, value2, field3, value3, field4, value4);

% Change Georgia mass value from 70 to 68
myStruct(2).Mass = 68;

% Add a new data to a struct by adding a new value to each field
% Then re-create a struct
value1(end+1) = {'Lily'};
value2(end+1) = {24};
value3(end+1) = {162};
value4(end+1) = {60};
myStruct = struct(field1, value1, field2, value2, field3, value3, field4, value4);

% Calculate the mean height of this group
mean_height = (sum([value3{:}])) / (length(value3));
disp(['Mean of height for this group: ', num2str(mean_height)]);

% Calculate a BMI which, BMI = Mass / Height^2 and create a new field
field5 = 'BMI'; value5 = {};
for i=1:length(value1)
    value5{end+1} = (value4{i} / value3{i}^2) * 10^4;
end
myStruct = struct(field1, value1, field2, value2, field3, value3, field4, value4, field5, value5);

% Display this struct
formatSpec = 'Name: %s, Age: %d, Height: %d, Mass: %d, BMI: %2.4f';
for i=1:length(value1)
    str_disp = sprintf(formatSpec, value1{i}, value2{i}, value3{i}, value4{i}, value5{i});
    disp(str_disp);
end
