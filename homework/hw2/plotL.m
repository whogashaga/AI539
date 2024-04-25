close all;
clear all;

x = [.30753, .56678, -.25177, .37243, .26375];
n = 5;

% create a grid of points for α, β
a = linspace(.2,.4,50);
b = linspace(.1,.2,50);
[alpha_grid, beta_grid] = meshgrid(a, b);

L = zeros(1, n);
disp(size(alpha_grid, 1));
disp(size(alpha_grid, 2));

% along with row number
for i = 1:size(alpha_grid, 1)
    % along with column number
    for j = 1:size(alpha_grid, 2)
        alpha = alpha_grid(i, j);
        beta = beta_grid(i, j);
        % calculate f(x|α,β) for each x value
        f_x = exp(-(x - alpha) ./ beta) ./ (beta * (1 + exp(-(x - alpha) ./ beta)).^2);
        % calculate L(α, β)
        L(i, j) = -log(prod(f_x));
    end
end

subplot(121);
surf(alpha_grid, beta_grid, L);
xlabel('α');
ylabel('β');
zlabel('L(α, β)');
