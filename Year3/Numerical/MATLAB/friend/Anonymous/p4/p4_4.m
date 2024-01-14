clear;
data = xlsread("data_pp4_q4.xls");

subplot(2,1,1);
plot(data(:,1),data(:,2));

subplot(2,1,2);
ndata = data;
ndata(ndata(ndata(:,2)>100),2) = 100;
ndata(ndata(ndata(:,2)<-100),2) = -100;
plot(ndata(:,1),ndata(:,2));
