clear all; close all; clc;
load('data.mat');

% % 2. Plot Samples
% % % Plot Samples % Unit Standard Deviation Contours

% % % CASE 1: A vs B
figure;
plot_error_variance(classes{1}, 10, {'r'});
hold on;
plot_error_variance(classes{2}, 10, {'k'});
plot_scatter({sample_A,sample_B}, {});
legend('U.S.D. Contour A', 'U.S.D. Contour B', 'Class A', 'Class B');
title('2. CASE 1: Samples & Unit Standard Deviation Contours');
hold off;

% % % CASE 2: C vs D vs E
figure;
plot_error_variance(classes{3}, 10, {'r'});
hold on;
plot_error_variance(classes{4}, 10, {'k'});
plot_error_variance(classes{5}, 10, {'m'});
plot_scatter({sample_C,sample_D,sample_E}, {}); 
legend('U.S.D. Contour C', 'U.S.D. Contour D', 'U.S.D. Contour E', 'Class C', 'Class D', 'Class E');
title('2. CASE 2: Samples & Unit Standard Deviation Contours');
hold off;