% estimate_1d_gaussian - Computes 1D estimation for Exponential data
function [lambda] = estimate_1d_exponential( data )
    [mu, lambda] = estimate_1d_gaussian(data);
    lambda = inv(mu);
end