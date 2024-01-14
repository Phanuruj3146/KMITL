load DOB.mat;

edges = [1946,1965,1981,1997,2013,year(datetime)];

s = split(string(DOB));
s = erase(s,',');
gen = discretize(double(s(:,4)),edges,'categorical',["Boomer","Gen X","Millennials","Gen Z","Gen A"]);

table = array2table(s,'VariableNames',["day","month","date","year"]);
table.generation = string(gen);
disp(groupcounts(table,'generation'));
disp(head(table,10));

disp(table(table.generation == "Gen A", :));
disp(table(table.month == "July", :));