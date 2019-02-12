% % Create grids for Case 1 and 2
case1_samps = {sample_A, sample_B};
[X_1, Y_1] = create_2d_grid(case1_samps, resolution);

case2_samps = {sample_C, sample_D, sample_E};
[X_2, Y_2] = create_2d_grid(case2_samps, resolution);

% % Generate classified 1 NN grids
k = 1;
NN_grid_c1 = classify_grid_by_kNN(case1_samps, X_1, Y_1, k);
NN_grid_c2 = classify_grid_by_kNN(case2_samps, X_2, Y_2, k);

% % Generate classified 5 NN grids
k = 5;
five_NN_grid_c1 = classify_grid_by_kNN(case1_samps, X_1, Y_1, k);
five_NN_grid_c2 = classify_grid_by_kNN(case2_samps, X_2, Y_2, k);
