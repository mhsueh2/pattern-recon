% % A VS B
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsA('mu'), clsA('sigma'); 
              clsB('mu'), clsB('sigma')};
MICD_grid_AB = classify_grid_by_MICD(class_data, X, Y);
figure;
contourf(X, Y, MICD_grid_AB);
hold on;
plot_scatter(samples, {'MICD Boundries', clsA('name'), clsB('name')});
hold off;

% % C VS D VS D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsC('mu'), clsC('sigma');
              clsD('mu'), clsD('sigma'); 
              clsE('mu'), clsE('sigma')};
MICD_grid_CDE = classify_grid_by_MICD(class_data, X, Y);
figure;
contourf(X, Y, MICD_grid_CDE);
hold on;
plot_scatter(samples, {'MICD Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;