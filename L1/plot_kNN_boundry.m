% % Create grids for Case 1 and 2
case1_samps = {sample_A, sample_B};
[X_1, Y_1] = create_2d_grid(case1_samps, resolution);

case2_samps = {sample_C, sample_D, sample_E};
[X_2, Y_2] = create_2d_grid(case2_samps, resolution);


% % Plot 1NN boundries for Case 1
figure;
contour(X_1, Y_1, NN_grid_c1, 'b');
hold on;
contour(X_1, Y_1, five_NN_grid_c1, 'r');
hold on;
plot_scatter(case1_samps, {});
legend('1NN Boundry', '5NN Boundry', 'Class 1', 'Class 2')
hold off;


% % Plot 5NN boundries for Case 2
figure;
contour(X_2, Y_2, NN_grid_c2, 'b');
hold on;
contour(X_2, Y_2, five_NN_grid_c2, 'r');
hold on;
plot_scatter(case2_samps, {});
legend('1NN Boundry', '5NN Boundry', 'Class 3', 'Class 4', 'Class 5')
hold off;
