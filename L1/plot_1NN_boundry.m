% % A VS B
k = 1;
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
NN_grid_AB = classify_grid_by_kNN(samples, X, Y, k);
figure;
contourf(X, Y, NN_grid_AB);
hold on;
plot_scatter(samples, {'1NN Boundries', clsA('name'), clsB('name')});
hold off;

% % C VS D VS D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
NN_grid_CDE = classify_grid_by_kNN(samples, X, Y, k);
figure;
contourf(X, Y, NN_grid_CDE);
hold on;
plot_scatter(samples, {'1NN Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;
