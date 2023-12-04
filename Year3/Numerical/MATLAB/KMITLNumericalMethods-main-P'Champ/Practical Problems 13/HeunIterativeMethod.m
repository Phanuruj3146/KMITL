function y_array = HeunIterativeMethod(dy,start,final,init,step,tol)

t = start:step:final;
y_array =  [ init ]; 

for j = 1:length(t)-1
    init_slope = dy(t(j),y_array(j));  % first initial slope
    init_next_y = y_array(j) + ( init_slope * step );   % first predicted y-val.
    iter = 0;
    while iter < 100
        next_slope = dy(t(j)+step,init_next_y);   % slope at first predicted y-val
        avg_slope = ( init_slope + next_slope )/2;   % average of initial slope and slope at firstly predicted y-val. 
        new_next_y = y_array(j) + ( avg_slope * step ); % newly predicted y-val.
        err = ( abs(( new_next_y - init_next_y ) / new_next_y ) ) * 100;  % comparing the relative error between two predicted y.
        if err < tol          % if the error is lower than the tolerance,
            y_array(end+1) = new_next_y;    % the newly predicted y becomes the approximation, adding it to the array.
            break
        else                  % or else, the newly predicted y become the first predicted y-val.
            init_next_y = new_next_y;
            iter = iter + 1;
        end
    end
    disp(iter)
end