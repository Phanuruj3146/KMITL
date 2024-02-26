function E = exchangeRow2(matrix, pivotRow, targetRow)
    % matrix: input matrix
    % pivotRow: row index of the pivot element
    % targetRow: row index to be swapped with the pivotRow
    
    % Check if the matrix is a square matrix
    [m, n] = size(matrix);
    if m ~= n
        error('Input matrix must be a square matrix.');
    end
    
    % Check if the pivotRow and targetRow are valid indices
    if pivotRow < 1 || pivotRow > m || targetRow < 1 || targetRow > m
        error('Invalid row indices.');
    end
    
    % Initialize the elementary matrix as an identity matrix
    E = eye(m);
    
    % Perform row swap in the elementary matrix
    disp(E([pivotRow, targetRow], :));
    disp(E([targetRow, pivotRow], :));
    E([pivotRow, targetRow], :) = E([targetRow, pivotRow], :);
end
