
n = 5;
x = [0.30753, 0.56678, -0.25177, 0.37243, 0.26375];
eta = 0.001;
iterates = 1000;
p = [2.0; 2.0];

% Gradient
gradient = @(alpha, beta) [
    -n/beta + 2*n/beta^2 * sum((x - alpha) .* exp(-(x - alpha) / beta) ./ (1 + exp(-(x - alpha) / beta)));
    -1/beta^2 * sum(x - alpha) + n/beta + 2*n/beta^2 * sum(exp(-(x - alpha) / beta) .* (x - alpha) ./ (1 + exp(-(x - alpha) / beta)))
];

% 1000 loops
alpha_values = zeros(iterates, 1);
beta_values = zeros(iterates, 1);
for i = 1:iterates
    grad = gradient(p(1), p(2));
    p = p - eta * grad;
    alpha_values(i) = p(1);
    beta_values(i) = p(2);
end

% final estimates of alpha and beta
fprintf('estimate of alpha: %.3f\n', p(1));
fprintf('estimate of beta: %.3f\n', p(2));

% Plot
figure;
subplot(1, 2, 1);
plot(1:iterates, alpha_values);
xlabel('Iterates');
ylabel('Alpha');
title('Iterates vs Alpha');

subplot(1, 2, 2);
plot(1:iterates, beta_values);
xlabel('Iterates');
ylabel('Beta');
title('Iterates vs Beta');
