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
max_x_a = max(a(1,:))+1;
max_x_b = max(b(1,:))+1;

%% Gaussian Estimation 
% Data Set A
[mu_a_est, sigma_a_est] = estimate_1d_gaussian(a);

data_range = min_x:resolution:max_x_a;
true_p = normpdf(data_range, mu_a, sigma_a);
est_p = normpdf(data_range, mu_a_est, sigma_a_est);
title_ = 'Set A Estimation Assuming Gaussian Density';

plot_1d_estimation(a, data_range, true_p, est_p, title_);

% Data Set B
[mu_b_est, sigma_b_est] = estimate_1d_gaussian(b);

data_range = min_x:resolution:max_x_b;
true_p = exppdf(data_range,mu_b);
est_p = normpdf(data_range,mu_b_est, sigma_b_est);
title_ = 'Set B Estimation Assuming Gaussian Density';

plot_1d_estimation(b, data_range, true_p, est_p, title_);

%% Exponential Estimation
% Data Set A
lambda_a_e = estimate_1d_exponential(a);
mu_a_e = inv(lambda_a_e);

data_range = min_x:resolution:max_x_a;
true_p = normpdf(data_range, mu_a, sigma_a);
est_p = exppdf(data_range, mu_a_e);
title_ = 'Set A Estimation Assuming Exponential Density';

plot_1d_estimation(a, data_range, true_p, est_p, title_);

% Data Set B
lambda_b_e = estimate_1d_exponential(b);
mu_b_e = inv(lambda_b_e);

data_range = min_x:resolution:max_x_b;
true_p = exppdf(data_range, mu_b);
est_p = exppdf(data_range, mu_b_e);
title_ = 'Set B Estimation Assuming Exponential Density';

plot_1d_estimation(b, data_range, true_p, est_p, title_);
