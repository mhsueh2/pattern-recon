run('classify_grid_by_MED');

samples = {sample_A, sample_B};
contourf(X,Y,MED_AB_final, 'Color', 'black', 'LineWidth', 2)
hold on;
plot_scatter(samples, {'MED Boundries', clsA('name'), clsB('name')});
hold off;

samples = {sample_C, sample_D, sample_E};
figure;
contourf(X,Y,MED_CDE_final, 'Color', 'black', 'LineWidth', 2)
hold on;
plot_scatter(samples, {'MED Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;