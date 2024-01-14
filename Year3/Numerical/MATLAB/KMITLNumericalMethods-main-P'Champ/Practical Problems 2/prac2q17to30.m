%% Q17
% function output = test1(x)
% tf = isa(x, "double") || isa(x, "int8");
% if tf == 1
%     if x > 0
%         disp('a number is positive.')
%         output = x * 2;
%     elseif x < 0
%         disp('a number is negative.')
%         output = x / 2;
%     end
% else
%     disp('Wrong type of input!')
% end
% end

%% Q18
% function output = test1(x)
% tf = isa(x, "double");
% if tf == 1
%     if mod(x, 2) == 0
%         disp('a number is even.')
%         output = x + 1;
%     elseif mod(x, 2) ~= 0
%         disp('a number is odd.')
%         output = x - 1;
%     end
% else
%     disp('Wrong type of input.')
% end
% end

%% Q19
% function output = test1(x, y)
% tf = isa(x, "double") && isa(y, "double");
% if tf == 1
%     if x == y
%         output = x + y;
%     else
%         output = x -y;
%         output = abs(output);
%     end
% else
%     disp('Wrong data type.')
% end
% end

%% Q20
% function output = test1(x, y)
% tf = isa(x, "double") && isa(y, "double");
% if tf == 1
%     if x + y == 10
%         output = true;
%     elseif x + y ~= 10
%         output = false;
%     end
% else
%     disp('Wrong data type.')
% end
% end

%% Q21
% function output = test1(x, y, z)
% tf = isa(x, "double") && isa(y, "double") && isa(z, "double");
% if tf == 1
%     arr = [x, y, z];
%     arr = sort(arr);
%     output = arr(2) + arr(3);
% else
%     disp('Wrong data type')
% end
% end

%% Q22
% function output = test1(x, y, z)
% tf = isa(x, "double") && isa(y, "double") && isa(z, "double");
% if tf == 1
%     arr = [x, y, z];
%     arr = sort(arr);
%     output = arr(1) - arr(3);
% else
%     disp('Wrong data type')
% end
% end

%% Q23
% function test1(x)
% tf = isvector(x);
% amount = length(x);
% if tf == 1
%     if amount < 2
%         disp('Requires more input.');
%     else
%         x = sort(x);
%         disp(['Lengths of a vector: ', num2str(amount)]);
%         disp(['The 2 smallest numbers: ', num2str(x(1)), ' and ' num2str(x(2))]);
%     end
% else
%     disp('Require a vector.');
% end
% end

%% Q24
% r = randi([0,1],1,10);
% find(r);

%% Q25
% r = randi(10, 4);
% disp(r);
% for i=1:numel(r)
%     if mod(r(i), 2) == 0
%         r(i) = 0;
%     end
% end
% disp(r);

%% Q26
% function test1(n)
% r = randi(10, n);
% disp(r);
% for i=1:numel(r)
%     if mod(r(i), 2) == 0
%         r(i) = 0;
%     end
% end
% disp(r);
% end

%% Q27
% function test1(n, m)
% r = randi(10, n, m);
% disp(r);
% for i=1:numel(r)
%     if mod(r(i), 2) ~= 0
%         r(i) = 0;
%     end
% end
% disp(r);
% end

%% Q28
% function test1(x, A)
% disp(A);
% for i=1:numel(A)
%     if A(i) > x
%         A(i) = 0;
%     end
% end
% disp(A);
% end

%% Q29


%% Q30
% function test1(n)
% eul = 0;
% for i=0:n
%     eul = eul + 1/(factorial(i));
% end
% disp(eul);
% end

%% Challenge Questions
