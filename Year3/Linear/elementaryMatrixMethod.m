function [R, E_combined] = elementaryMatrixMethod(A)
    [m, n] = size(A);
    R = A;  % Initialize the reduced matrix
    
    E_combined = eye(m);  % Initialize combined elementary matrix
    
    for col = 1:min(m, n)
        % Find the pivot row
        pivot_row = find(R(col:end, col) ~= 0, 1, 'first') + col - 1;
        elementaryMatrixMethod
        % Perform elementary row operation to make pivot element 1
        E1 = eye(m);
        E1(pivot_row, :) = E1(pivot_row, :) / R(pivot_row, col);
        R = E1 * R;
        E_combined = E1 * E_combined;
        
        % Perform elementary row operations to make other elements in the column zero
        for row = 1:m
            if row ~= pivot_row
                E2 = eye(m);
                E2(row, col) = -R(row, col);
                R = E2 * R;
                E_combined = E2 * E_combined;
            end
        end
    end
end
