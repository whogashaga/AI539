close all;
clear all;

n = [1 2 3 4 5];
a = linspace(.2,.4,5);
Alpha = meshgrid(a, a);

b  = linspace(.1,.2,5);
Beta = meshgrid(b, b);

x = [.30753, .56678, -.25177, .37243, .26375];
L = zeros(1, 5);

%disp(alpha);
%disp(beta);

for i = 1:5

    alpha = Alpha(i);
    beta = Beta(i);
    ML = 0;

    for j = 1:5
       ML = ML - log(exp(-(x(i)-alpha(i))/beta(i)) / beta(i) * (1 + exp(-(x(i)-alpha(i))/beta(i))).^2);
    end

    L(i) = ML; 
end

subplot(121);
surf(Alpha, Beta, L);
xlabel('\alpha');
ylabel('\beta');

