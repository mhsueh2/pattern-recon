% estimate_1d_gaussian - Computes 2D estimation for Gaussian data
function [mu_x, mu_y, sigma_x, sigma_y] = estimate_2d_gaussian( data )
    [mu_x, sigma_x] = estimate_1d_gaussian(data(:,1));
    [mu_y, sigma_y] = estimate_1d_gaussian(data(:,2));
end