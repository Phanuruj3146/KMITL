function intervals = incremental_search(f, x0, xend, step)
    % Initialize variables
    intervals = {};
    prev_x = x0;
    prev_y = f(prev_x);

    % Iterate through the range
    for x = x0:step:xend
        y = f(x);

        % Check for sign change (possible interval with root)
        if y * prev_y <= 0
            interval_start = prev_x;
            interval_end = x;
            intervals{end+1} = [interval_start, interval_end];
        end

        prev_x = x;
        prev_y = y;
    end
end
