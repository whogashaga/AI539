close all;
clear all;

iterates = 10;
n = 5;
x = [.30753, .56678, -.25177, .37243, .26375];

%% creat 100 samples alpha and beta
alpha = linspace(.2,.4,iterates);
beta = linspace(.1,.2,iterates);

%% Set initial value
alpha(1) = 2.0;
beta(1)  = 2.0;


f = 1.0;
disp(f)

for i = 1:n
    f = f * exp(-(x(i)-alpha(i))/beta(i)) / beta(i) * (1 + exp(-(x(i)-alpha(i))/beta(i))).^2;
end

disp("f1: "+ f);
f = -log(f);

disp("f2: "+ f);
