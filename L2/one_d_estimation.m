% % Set given parameters and load data
addpath('functions/');
addpath('data/');

% Loads Set A: Gaussian, Set B: Exponential
load('lab2_1.mat')
mu_a = 5;
sigma_a = 1;
lambda_b = 1;
mu_b = inv(lambda_b);

min_x = 0;
data_range_a = min_x:resolution:max(a(1,:))+1;
data_range_b = min_x:resolution:max(b(1,:))+1;

true_p_a = normpdf(data_range_a, mu_a, sigma_a);
true_p_b = exppdf(data_range_b, mu_b);

%% Gaussian Estimation 
% Data Set A
[mu_a_est, sigma_a_est] = estimate_1d_gaussian(a);
est_p = normpdf(data_range_a, mu_a_est, sigma_a_est);
title_ = 'Set A Estimation Assuming Gaussian Density';

plot_1d_estimation(a, data_range_a, true_p_a, est_p, title_);

% Data Set B
[mu_b_est, sigma_b_est] = estimate_1d_gaussian(b);
est_p = normpdf(data_range_b,mu_b_est, sigma_b_est);
title_ = 'Set B Estimation Assuming Gaussian Density';

plot_1d_estimation(b, data_range_b, true_p_b, est_p, title_);

%% Exponential Estimation
% Data Set A
lambda_a_e = estimate_1d_exponential(a);
mu_a_e = inv(lambda_a_e);
est_p = exppdf(data_range_a, mu_a_e);
title_ = 'Set A Estimation Assuming Exponential Density';

plot_1d_estimation(a, data_range_a, true_p_a, est_p, title_);

% Data Set B
lambda_b_e = estimate_1d_exponential(b);
mu_b_e = inv(lambda_b_e);
est_p = exppdf(data_range_b, mu_b_e);
title_ = 'Set B Estimation Assuming Exponential Density';

plot_1d_estimation(b, data_range_b, true_p_b, est_p, title_);



%% Uniform Estimation
% Data Set A
[min_a, max_a] = estimate_1d_uniform(a);
est_p = unifpdf(data_range_a, min_a, max_a);
title_ = 'Set A Estimation Assuming Uniform Density';

plot_1d_estimation(a, data_range_a, true_p_a, est_p, title_);

% Data Set B
[min_b, max_b] = estimate_1d_uniform(b);
est_p = unifpdf(data_range_b, min_b, max_b);
title_ = 'Set B Estimation Assuming Uniform Density';

plot_1d_estimation(b, data_range_b, true_p_b, est_p, title_);
