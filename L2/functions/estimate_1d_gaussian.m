% estimate_1d_gaussian - Computes 1D estimation for Gaussian data
function [mu, sigma] = estimate_1d_gaussian( data )
    mu = mean(data);
    sigma = std(data);
end