% % Set given parameters and load data
addpath('functions/');
addpath('data/');
resolution = 0.01;

% Loads Set A: Gaussian, Set B: Exponential
load('lab2_1.mat')
mu_a = 5;
sigma_a = 1;
lambda_b = 1;
mu_b = inv(lambda_b);

min_x = 0;
x_range_a = min_x:resolution:max(a(1,:))+1;
x_range_b = min_x:resolution:max(b(1,:))+1;

true_p_a = normpdf(x_range_a, mu_a, sigma_a);
true_p_b = exppdf(x_range_b, mu_b);

%% Gaussian Estimation 
% Data Set A
[mu_a_est, sigma_a_est] = estimate_1d_gaussian(a);
est_p = normpdf(x_range_a, mu_a_est, sigma_a_est);
title_ = 'Set A Estimation Assuming Gaussian Density';

plot_1d_estimation(a, x_range_a, true_p_a, est_p, title_);
Section = [Section;'2.1.a'];
Answer = [Answer; join(['mean var =', string(mu_a_est), ' ', string(sigma_a_est^2)])];

% Data Set B
[mu_b_est, sigma_b_est] = estimate_1d_gaussian(b);
est_p = normpdf(x_range_b,mu_b_est, sigma_b_est);
title_ = 'Set B Estimation Assuming Gaussian Density';

plot_1d_estimation(b, x_range_b, true_p_b, est_p, title_);
Section = [Section;'2.1.b'];
Answer = [Answer; join(['mean var =', string(mu_b_est),' ', string(sigma_b_est^2)])];

%% Exponential Estimation
% Data Set A
lambda_a_e = estimate_1d_exponential(a);
mu_a_e = inv(lambda_a_e);
est_p = exppdf(x_range_a, mu_a_e);
title_ = 'Set A Estimation Assuming Exponential Density';

plot_1d_estimation(a, x_range_a, true_p_a, est_p, title_);
Section = [Section;'2.2.a'];
Answer = [Answer; join(['lambda =', string(lambda_a_e)])];

% Data Set B
lambda_b_e = estimate_1d_exponential(b);
mu_b_e = inv(lambda_b_e);
est_p = exppdf(x_range_b, mu_b_e);
title_ = 'Set B Estimation Assuming Exponential Density';

plot_1d_estimation(b, x_range_b, true_p_b, est_p, title_);
Section = [Section;'2.2.b'];
Answer = [Answer; join(['lambda =', string(lambda_b_e)])];

%% Uniform Estimationb
% Data Set A
[a_est, b_est] = estimate_1d_uniform(a);
est_p = unifpdf(x_range_a, a_est, b_est);
title_ = 'Set A Estimation Assuming Uniform Density';

plot_1d_estimation(a, x_range_a, true_p_a, est_p, title_);
Section = [Section;'2.3.a'];
Answer = [Answer; join(['a b =', string(a_est),' ', string(b_est)])];

% Data Set B
[a_est, b_est] = estimate_1d_uniform(b);
est_p = unifpdf(x_range_b, a_est, b_est);
title_ = 'Set B Estimation Assuming Uniform Density';

plot_1d_estimation(b, x_range_b, true_p_b, est_p, title_);
Section = [Section;'2.3.b'];
Answer = [Answer; join(['a b =', string(a_est),' ', string(b_est)])];

%% Parzen Estimation
% Define parameters
sd_1 = 0.1;
sd_2 = 0.4;

% Data Set A
est_p = estimate_1d_parzen(a, x_range_a, sd_1);
title_ = 'Set A Estimation Using Parzen Density (SD = 0.1)';
plot_1d_estimation(a, x_range_a, true_p_a, est_p, title_);

est_p = estimate_1d_parzen(a, x_range_a, sd_2);
title_ = 'Set A Estimation Using Parzen Density (SD = 0.4)';
plot_1d_estimation(a, x_range_a, true_p_a, est_p, title_);

% Data Set B
est_p = estimate_1d_parzen(b, x_range_b, sd_1);
title_ = 'Set B Estimation Using Parzen Density (SD = 0.1)';
plot_1d_estimation(b, x_range_b, true_p_b, est_p, title_);

est_p = estimate_1d_parzen(b, x_range_b, sd_2);
title_ = 'Set B Estimation Using Parzen Density (SD = 0.4)';
plot_1d_estimation(b, x_range_b, true_p_b, est_p, title_);