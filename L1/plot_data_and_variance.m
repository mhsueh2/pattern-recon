% % 2. Plot samples
% % % Plot Samples and Unit standard deviation contours

% % % Plot A vs B
figure;
plot_error_variance(classes{1}, 10, {'r'});
hold on;
plot_error_variance(classes{2}, 10, {'k'});
plot_scatter({sample_A,sample_B}, {'U.S.D. Contour A', 'U.S.D. Contour B', 'Class A', 'Class B'});
title('2. CASE 1: Samples & Unit Standard Deviation Contours');
hold off;

% % % Plot C vs D vs E
figure;
plot_error_variance(classes{3}, 10, {'r'});
hold on;
plot_error_variance(classes{4}, 10, {'k'});
plot_error_variance(classes{5}, 10, {'m'});
plot_scatter({sample_C,sample_D,sample_E}, {'U.S.D. Contour C', 'U.S.D. Contour D', 'U.S.D. Contour E', 'Class C', 'Class D', 'Class E'}); 
title('2. CASE 2: Samples & Unit Standard Deviation Contours');
hold off;