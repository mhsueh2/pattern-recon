% % Set given parameters and load data
addpath('functions/');
addpath('data/');

% lab2_1.mat sets dataset a and b
load('lab2_1.mat')
mu_a = 5;
sigma_a = 1;
lambda_b = 1;
min_x = 0;
max_x_a = max(a(1,:))+1;
max_x_b = max(b(1,:))+1;

%% Gaussian
% Data Set A
[mu_e, sigma_e] = estimate_1d_gaussian(a);

data_range = min_x:resolution:max_x_a;
true_p = normpdf(data_range, mu_a, sigma_a);
est_p = normpdf(data_range, mu_e, sigma_e);
title_ = 'Set A Estimation Assuming Gaussian Density';

plot_1d_estimation(a, data_range, true_p, est_p, title_);

% Data Set B
[mu_e, sigma_e] = estimate_1d_gaussian(b);

data_range = min_x:resolution:max_x_b;
true_p = exppdf(data_range,1/lambda_b);
est_p = normpdf(data_range,mu_e, sigma_e);
title_ = 'Set B Estimation Assuming Gaussian Density';

plot_1d_estimation(b, data_range, true_p, est_p, title_);