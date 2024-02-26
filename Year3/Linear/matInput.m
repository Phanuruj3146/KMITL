% matrix = [0, 2, 3; 4, 0, 0; 7, 8, 9; 0, 8, 9];
% [rowReductionMatrices, rrefMatrix] = rowReduceMatrix(matrix);
% rowReduceMatrix2(matrix)
% % disp(rowReductionMatrices);
% %%rowReductionMatrices*matrix

% inputMatrix = [1, 2, 3; 0, 0, 1; 4, 5, 6; 5, 4, 2];
% [outputMatrix, elementaryMatrix] = exchangeRow(inputMatrix);
% disp('Result Matrix:');
% disp(outputMatrix);

% Example usage
A = [1 2 3; 4 5 6; 7 8 9];
pivotRow = 1;
targetRow = 3;

E = exchangeRow2(A, pivotRow, targetRow);
disp('Original Matrix:');
disp(A);
disp('Elementary Matrix for Row Swap:');
disp(E);
disp('Result after Row Swap:');
disp(E * A);


