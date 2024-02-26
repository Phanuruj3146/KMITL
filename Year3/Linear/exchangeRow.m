function [resultMatrix, elementaryMatrix] = exchangeRow(inputMatrix)
    [r, c] = size(inputMatrix);
    disp(r);
    resultMatrix = inputMatrix;
    elementaryMatrix = eye(r);  % Initialize the elementary matrix as an identity matrix
    % for i = 1:m
    %     if 
end
