A = [1,-3,0;0,1,3;2,-10,2];
prev = 0; % not implemented checking upper rows, lower rows ,and bottom rows
for i = 1:length(A)
    for j = 1:length(A(1,:))
        fprintf("%d %d\n",i,j);
        if A(i,j) ~= 0 && j<i 
            A(i,j+1) = abs(A(i,j+1))+abs(A(i,j));
            A(i,j) = 0;
            prev = j+1;
        end
    end
end

disp(A);