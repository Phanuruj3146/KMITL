myStruct = struct('Name',{"Harry", "Georgia", "Elizabeth"}, 'Age',{36, 21, 78}, 'Height', {170, 181, 158}, 'Mass',{80, 70, 65});

myStruct(2).Mass = 68;

myStruct(end+1) = struct('Name',"Lily", 'Age',24, 'Height',162, 'Mass',60);

disp(mean([myStruct.Height]));

bmi = num2cell([myStruct.Mass]./[myStruct.Height].*100);
[myStruct(:).bmi] = deal(bmi{:});

for i= 1:length([myStruct.Age])
    fprintf("%s Age:%d Height:%d Mass:%d BMI:%.2f \n", myStruct(i).Name, myStruct(i).Age, myStruct(i).Height, myStruct(i).Mass, myStruct(i).bmi);
end