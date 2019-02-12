% % A VS B
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsA('mu'), clsA('sigma'), clsA('N'); 
              clsB('mu'), clsB('sigma'), clsB('N')};
MAP_grid_AB = classify_grid_by_MAP(class_data, X, Y);
figure;
contour(X, Y, MAP_grid_AB, 'blue');
hold on;
plot_scatter(samples, {'MAP Boundries', clsA('name'), clsB('name')});
hold off;

% % C VS D VS D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsC('mu'), clsC('sigma'), clsC('N');
              clsD('mu'), clsD('sigma'), clsD('N'); 
              clsE('mu'), clsE('sigma'), clsE('N')};
MAP_grid_CDE = classify_grid_by_MAP(class_data, X, Y);
figure;
contour(X, Y, MAP_grid_CDE, 'blue');
hold on;
plot_scatter(samples, {'MAP Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;