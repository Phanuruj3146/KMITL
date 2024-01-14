tstart=0;tend=20;ni=8;

i = 2:ni+1;
d = tend-tstart;
t(1)=tstart;
t(i) = 20/8*(i-1);
y(1)=12 + 6*cos(2*pi*t(1)/d);
y(i)=12 + 6*cos(2*pi*t(i)/d);