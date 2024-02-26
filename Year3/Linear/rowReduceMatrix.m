function [elementaryMatrices, reducedRowEchelonForm] = rowReduceMatrix(matrix)
    [m, n] = size(matrix);
    
    % Initialize elementaryMatrices and reducedRowEchelonForm
    elementaryMatrices = cell(1, m);
    reducedRowEchelonForm = matrix;
    
    % Iterate through each row to make leading entries 1
    for i = 1:min(m, n)
        leadingEntry = reducedRowEchelonForm(i, i);
        if leadingEntry ~= 0
            % Generate elementary matrix to make leading entry 1
            elementaryMatrices{i} = eye(m);
            elementaryMatrices{i}(i, i) = 1 / leadingEntry;
            
            % Apply elementary matrix to the current row
            reducedRowEchelonForm = elementaryMatrices{i} * reducedRowEchelonForm;
            
            % Perform elementary row operations to make other entries in the column zero
            for j = 1:m
                if j ~= i
                    multiplier = -reducedRowEchelonForm(j, i);
                    elementaryMatrices{j} = eye(m);
                    elementaryMatrices{j}(j, i) = multiplier;
                    reducedRowEchelonForm = elementaryMatrices{j} * reducedRowEchelonForm;
                end
            end
        end
    end
    
    % Display elementary matrices
    disp('Elementary Matrices:');
    for i = 1:m
        disp(elementaryMatrices{i});
    end
    
    % Display reduced row echelon form
    disp('Reduced Row Echelon Form:');
    disp(reducedRowEchelonForm);
end
