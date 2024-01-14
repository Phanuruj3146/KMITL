%% Practical Problems 4 Question 4

% Read data from the question by double click it and add, also make it var
data = datapp4q4.DataValue;
time = datapp4q4.Time;

% Plot data vs. time หรือก็คือ x = เวลา และ y = ข้อมูล
subplot(2, 1, 1);
plot(time, data);
title('Raw Data');
xlabel('Time');
ylabel('Data');

% Normalize data by 1.) copy data and 2.) make this copy normalize
data_normalize = data;
data_normalize(data_normalize < -100) = -100;
data_normalize(data_normalize > 100) = 100;

% Then plot
subplot(2, 1, 2);
plot(time, data_normalize);
title('Normalize Data');
xlabel('Time');
ylabel('Data');