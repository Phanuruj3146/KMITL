%% Template for Question 4
%{
Fit y = a0 + a1*T + a2*c
where y is the dissolved oxygen concentration.
New Table for 2 variables:
 T  | c  | y = Oxygen 
=====================
 0  | 0  | 14.6
 5  | 0  | 12.8
 10 | 0  | 11.3
 15 | 0  | 10.1
 20 | 0  | 9.09
 25 | 0  | 8.26
 30 | 0  | 7.56
 0  | 10 | 12.9
 5  | 10 | 11.3
 10 | 10 | 10.1
 15 | 10 | 9.03
 20 | 10 | 8.17
 25 | 10 | 7.46
 30 | 10 | 6.85
 0  | 20 | 11.4
 5  | 20 | 10.3
 10 | 20 | 8.96
 15 | 20 | 8.08
 20 | 20 | 7.35
 25 | 20 | 6.73
 30 | 20 | 6.20
%}
t = 0:5:30;
T = [t t t]';
c = [0 0 0 0 0 0 0 10 10 10 10 10 10 10 20 20 20 20 20 20 20]';
y = [14.6 12.8 11.3 10.1 9.09 8.26 7.56 12.9 11.3 10.1 9.03 8.17 7.46 6.85 11.4 10.3 8.96 8.08 7.35 6.73 6.20]';

% Create Z-Matrix (see slides 21-25):
Z = [ ones(size(T)) T c];
xx= Z'*Z;
% Solve the Z-matrix equation:
a = (Z'*Z)\(Z'*y) ;

% Create fitted function:
f = @(T,c) a(1)+a(2).*T+a(3).*c  ; % Remember to be careful how you use your coefficients

% Evaluate where the question is asking you:
oxygen = f(12,15)