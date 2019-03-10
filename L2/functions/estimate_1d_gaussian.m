% estimate_1d_gaussian - Computes 1D estimation for Gaussian data
function [mu, sigma] = estimate_1d_gaussian( data )
    N = length(data);

    mu = sum(data) / N;
    sigma = sqrt(sum((data - mu).^2) / N);
end