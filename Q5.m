%% Finding the root of the Redlich Kwong Equation of State using fzero function

clear; clc; close all;

%% System Parameters and fzero
%% storing data into variable considering CO2
a = 63.81;  % atm(K^0.5)(L/mol)^2
b = 2.97e-2;  % L/mol
R = 0.0821;  % Latm/molK
T = 340;  % K
P = 98.69;  % atm

%% Plot the Function 
syms x
f(x) = (R*T)/(x-b) - ((a)/((T^0.5)*x*(x+b))) - P;
ht = matlabFunction(f);

figure
fplot(ht(x),[-1 1]);
grid on

%% Select a suitable x_0 and calling the fzero function
statefunc = @(x) (R*T)/(x-b) - ((a)/((T^0.5)*x*(x+b))) - P;
format long;
xsol = fzero(statefunc, 0.15)

%% Finding Accuracy
check_ans = statefunc(0.164690181215075)
error = 0 - check_ans

%% Since error is very much less than the tolerance 
%% Hence the answer is correct