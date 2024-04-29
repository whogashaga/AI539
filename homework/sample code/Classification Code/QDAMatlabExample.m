
% simple LDA example

% loading the data
load ClassificationData.mat;

% Extracting the features and classes from the data
Xf = X(:,1:2);
y = X(:,3);
N = size(Xf,1);

% finding the index of each class
I1 = find(y==1);
I2 = find(y==2);
I3 = find(y==3);

Xf1 = Xf(I1,:);
Xf2 = Xf(I2,:);
Xf3 = Xf(I3,:);

n1 = size(Xf1,1);
n2 = size(Xf2,1);
n3 = size(Xf3,1);
% plotting the 2d data along with the classes
figure('position',[200 200 1100 500]);
subplot(121)
plot(Xf1(:,1),Xf1(:,2),'*');hold on;
plot(Xf2(:,1),Xf2(:,2),'+r');
plot(Xf3(:,1),Xf3(:,2),'og');

% evaluating the LDA estimates
pi1 = n1/N;
pi2 = n2/N;
pi3 = n3/N;

mu1 = mean(Xf1);
mu2 = mean(Xf2);
mu3 = mean(Xf3);

Sigma1 = 1/(n1-1)*(Xf1 - repmat(mu1,[n1,1]))'*(Xf1 - repmat(mu1,[n1,1]));
Sigma2 = 1/(n2-1)*(Xf2 - repmat(mu2,[n2,1]))'*(Xf2 - repmat(mu2,[n2,1]));
Sigma3 = 1/(n3-1)*(Xf3 - repmat(mu3,[n3,1]))'*(Xf3 - repmat(mu3,[n3,1]));

ISigma1 = inv(Sigma1);
ISigma2 = inv(Sigma2);
ISigma3 = inv(Sigma3);

LSigma1 = -.5*log(det(Sigma1));
LSigma2 = -.5*log(det(Sigma2));
LSigma3 = -.5*log(det(Sigma3));

% creating a dense grid to show the classification regions
x = linspace(-8,8,200);
y = linspace(-8,12,200);

[X, Y] = meshgrid(x,y);
points = [X(:) Y(:)];

delta1 = zeros(40000,1);
delta2 = zeros(40000,1);
delta3 = zeros(40000,1);

for i = 1:40000
    delta1(i) =  LSigma1 - .5* (points(i,:) - mu1)*ISigma1*(points(i,:) - mu1)' + log(pi1);
    delta2(i) =  LSigma2 - .5* (points(i,:) - mu2)*ISigma2*(points(i,:) - mu2)' + log(pi2);
    delta3(i) =  LSigma3 - .5* (points(i,:) - mu3)*ISigma3*(points(i,:) - mu3)' + log(pi3);
end
Delta = [delta1, delta2, delta3];
[~, IDelta] = max(Delta');

IDelta = reshape(IDelta,[200 200]);


subplot(122)
mesh(X,Y,IDelta);hold on;
plot3(Xf1(:,1),Xf1(:,2),4*ones(50,1),'*');hold on;
plot3(Xf2(:,1),Xf2(:,2),4*ones(60,1),'+r');
plot3(Xf3(:,1),Xf3(:,2),4*ones(70,1),'og');
view([0,90])





