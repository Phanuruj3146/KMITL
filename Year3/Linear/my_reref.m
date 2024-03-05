function reduced_matrix = my_reref(matrix)
    [m, n] = size(matrix);
    
    % Initialize row and column indices
    row_idx = 1;
    col_idx = 1;

    while row_idx <= m && col_idx <= n
        % Find pivot element
        [pivot, pivot_row] = max(abs(matrix(row_idx:end, col_idx)));
        pivot_row = pivot_row + row_idx - 1;

        % Swap rows if needed
        if pivot ~= 0
            matrix([row_idx, pivot_row], col_idx:end) = matrix([pivot_row, row_idx], col_idx:end);
            % Scale the pivot row to have a leading 1
            matrix(row_idx, col_idx:end) = matrix(row_idx, col_idx:end) / matrix(row_idx, col_idx);
            
            % Eliminate other entries in the column
            for i = 1:m
                if i ~= row_idx
                    matrix(i, :) = matrix(i, :) - matrix(i, col_idx) * matrix(row_idx, :);
                end
            end
            row_idx = row_idx + 1;
        end
        
        col_idx = col_idx + 1;
    end

    reduced_matrix = matrix;
end
