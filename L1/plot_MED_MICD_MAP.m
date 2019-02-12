% % A VS B
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsA('mu'), clsA('sigma'), clsA('N'); 
              clsB('mu'), clsB('sigma'), clsB('N')};
%MED_grid_AB =
MICD_grid_AB = classify_grid_by_MICD(class_data, X, Y);
MAP_grid_AB = classify_grid_by_MAP(class_data, X, Y);
figure;
contour(X, Y, MICD_grid_AB, 'green');
hold on;
contour(X, Y, MAP_grid_AB, 'blue');
plot_error_variance(classes{1}, 10, {'r'});
plot_error_variance(classes{2}, 10, {'k'});
plot_scatter(samples, {'MICD Boundary', 'MAP Boundary', 'U.S.D. Contour A', 'U.S.D. Contour B', clsA('name'), clsB('name')});
title('3. CASE 1: MED/MICD/MAP Boundaries');
hold off;

% % C VS D VS D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsC('mu'), clsC('sigma'), clsC('N');
              clsD('mu'), clsD('sigma'), clsD('N'); 
              clsE('mu'), clsE('sigma'), clsE('N')};
%MED_grid_CDE =
MICD_grid_CDE = classify_grid_by_MICD(class_data, X, Y);
MAP_grid_CDE = classify_grid_by_MAP(class_data, X, Y);
figure;
contour(X, Y, MICD_grid_CDE, 'green');
hold on;
contour(X, Y, MAP_grid_CDE, 'blue');
plot_error_variance(classes{3}, 10, {'r'});
plot_error_variance(classes{4}, 10, {'k'});
plot_error_variance(classes{5}, 10, {'m'});
plot_scatter(samples, {'MICD Boundary', 'MAP Boundary', 'U.S.D. Contour C', 'U.S.D. Contour D', 'U.S.D. Contour E', clsC('name'), clsD('name'), clsE('name')});
title('3. CASE 2: MED/MICD/MAP Boundaries');
hold off;