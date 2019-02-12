clear all; close all; clc;
load('data.mat');
load('kNN_grids.mat');

% % 3. Plot Boundary Lines
% % % Plot Samples % NN/5NN Boundaries

% % Create grids for Case 1 and 2
case1_samps = {sample_A, sample_B};
[X_1, Y_1] = create_2d_grid(case1_samps, resolution);

case2_samps = {sample_C, sample_D, sample_E};
[X_2, Y_2] = create_2d_grid(case2_samps, resolution);


% % Plot 1NN boundries for Case 1
figure;
contour(X_1, Y_1, NN_grid_c1, 'green');
hold on;
contour(X_1, Y_1, five_NN_grid_c1, 'blue');
plot_scatter(case1_samps, {});
legend('NN Boundary', '5NN Boundary', 'Class 1', 'Class 2')
title('3. CASE 1: NN/5NN Boundaries');
hold off;


% % Plot 5NN boundries for Case 2
figure;
contour(X_2, Y_2, NN_grid_c2, 'green');
hold on;
contour(X_2, Y_2, five_NN_grid_c2, 'blue');
plot_scatter(case2_samps, {});
legend('NN Boundary', '5NN Boundary', 'Class 3', 'Class 4', 'Class 5')
title('3. CASE 2: NN/5NN Boundaries');
hold off;
