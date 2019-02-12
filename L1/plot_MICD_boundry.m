%resolution = 0.05;
% % A VS B
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsA('mu'), clsA('sigma'); 
              clsB('mu'), clsB('sigma')};
MICD_grid_AB = classify_grid_by_MICD(class_data, X, Y);
figure;
contour(X, Y, MICD_grid_AB, 'red');
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
contour(X, Y, MICD_grid_CDE, 'red');
hold on;
plot_scatter(samples, {'MICD Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;