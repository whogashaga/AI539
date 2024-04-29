close all
clear all;
x = linspace(-.8,2.5,100);
[p1 ,p2] = meshgrid(x,x);

C = (1 - p1).^2 + (1-p2).^2 - 2*exp(-3*p1.^2 - 3*p2.^2);
grad = @(p1,p2) [2*(p1-1) + 12*p1.*exp(-3*p1.^2 - 3*p2.^2); 2*(p2-1) + 12*p2.*exp(-3*p1.^2 - 3*p2.^2)];
figure('position',[100 100 1300 600]);
subplot(121);
surf(p1,p2,C);view([33,26])
subplot(122);
contour(p1,p2,C,linspace(-.3,6,50))


setting = 2;

switch setting
    case 1
        %% setting 3: large learning rate
        p  = [2.5,2.5];
        eta = .1;
        gamma = 0;
    case 2
        %% setting 3: too large learning rate
        p  = [2.5,2.5];
        eta = .1;
        gamma = .7;
end

theta = [0;0];

hold on;
plot(p(1),p(2),'*');
for i = 1 : 100
    theta = gamma*theta + eta*grad(p(1),p(2));
    p = p - theta;
    pause(.01);
    plot(p(1),p(2),'*');
    
end