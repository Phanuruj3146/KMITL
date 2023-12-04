function [t ,y_array] = RungeKuttaFourth(dy,start,final,init,step)

t = [ start:step:final ];
y_array = [ init ];

for j = 1 : length(t) - 1;
    k1 = dy( t(j) , y_array(j) );
    k2 = dy( t(j) + ((1/2)*step) , y_array(j) + ((1/2)*k1*step));
    k3 = dy( t(j) + ((1/2)*step) , y_array(j) + ((1/2)*k2*step));
    k4 = dy( t(j) + step , y_array(j) + (k3*step));
    y_array(end+1) = y_array(j) + (step/6)*( k1 + 2*k2 + 2*k3 + k4 );
end