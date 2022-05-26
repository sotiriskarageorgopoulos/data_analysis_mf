function [J_costs,thetas] = sgd_log(initial_thetas, x, y) 

    m = size(x,1);
    x = [ones(m,1) x];

    h = 1 ./ (1 + exp(-(x * initial_thetas)));

    J_costs = - (1/m) * sum(y .* log(h) + (1-y) .* log(1-h) );
    thetas = zeros(size(initial_thetas, 1),1);

    for i = 1 : size(thetas)
        thetas(i) = (1/m) * sum((h-y)' * x(:, i) );
    end
end