function plot_error_variance(class, p)
    mu = class('mu');
    sigma = class('sigma');
    plotErrorEllipse(mu, sigma, p);
end

function plotErrorEllipse(mu, Sigma, p)
    s = -2 * log(1 - p);

    [V, D] = eig(Sigma * s);

    t = linspace(0, 2 * pi);
    a = (V * sqrt(D)) * [cos(t(:))'; sin(t(:))'];

    plot(a(1, :) + mu(1), a(2, :) + mu(2));
end