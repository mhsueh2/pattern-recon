% estimate_1d_gaussian - Computes 2D estimation for Gaussian data
function [mu_x, mu_y, sigma_x, sigma_y] = estimate_2d_gaussian( data )
    mu = mean(data);
    sigma = std(data);
    
    mu_x = mu(1);
    mu_y = mu(2);
    sigma_x = sigma(1);
    sigma_y = sigma(2);
end