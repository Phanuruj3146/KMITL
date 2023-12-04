% Differentiate the function and input it here to find the turning points

% horizontal tangent is where the derivative of the function is 0
syms x
f = @(x) cos((x.^2)/2) + cos(2*x);
dm = str2func( [ '@(x)' char( diff(f, x) ) ] ) ;
    
% Locate the roots using any methods    
figure(1)
fplot(dm, [-pi,pi], 'b')

% from the graph the xs where ys are 0 are around -2 0 2

%----------------fzero
root1 = fzero(dm, -2);
root2 = fzero(dm, 0);
root3 = fzero(dm, 2);
fzeroRoots = [root1 root2 root3];

disp('fzero method')
fprintf('root 1 is at %f   root 2 is at %f   root 3 is at %f\n', root1, root2, root3)
fprintf('dm(root1) = %f    dm(root2) =  %f   dm(root3) =  %f\n\n', dm(root1), dm(root2), dm(root3))
figure(2)
subplot(3,1,1)
fplot(f, [-pi, pi], 'b')
hold on
grid on
plot(fzeroRoots, f(fzeroRoots), 'o' ,...
    'MarkerSize',5,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','b')
title('fzero')