function [monte_int] = MonteCarloIntegration(max_x,min_x,max_y,min_y,func,tol)
    
    % domain comes from the integral area.

    n = 0;
    error = 5000;
    samples = 100000;
    x = (max_x - min_x).*rand(samples,1)+min_x;
    y = (max_y - min_y).*rand(samples,1)+min_y;
    value = [];
    
    while n < samples || tol < error
        n = n+1;
        value(end + 1) = (max_x-min_x).*(max_y-min_y)*func(x(n),y(n));
        if length(value) >= 2
            error = value(end) - value(end-1);
        end
        if length(value) == n
            disp('Maximum number of iterations reached. Result may be inaccurate.')
            break
        end
    end
    monte_int = sum(value)/n;
end