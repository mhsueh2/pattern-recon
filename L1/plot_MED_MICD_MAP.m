clear all; close all; clc;
load('data.mat');

% % 3. Plot Boundary Lines
% % % Plot Samples % Unit Standard Deviation Contours & MED/MICD/MAP Boundaries

% % CASE 1: A vs B
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsA('mu'), clsA('sigma'), clsA('N'); 
              clsB('mu'), clsB('sigma'), clsB('N')};
%MED_grid_AB
MED_AB = classify_grid_by_MED(classes{1}('mu'), classes{2}('mu'), X, Y);
MED_AB_final = zeros(size(X, 1), size(Y, 2));
for i=1:size(X,1)
    for j=1:size(Y,2)
        if MED_AB(i,j) >= 0
            MED_AB_final(i,j) = 1;
        elseif MED_AB(i,j) <= 0
            MED_AB_final(i,j) = 2;
        else
            disp('Error creating MED_AB_final...');
        end
    end
end
%MED_grid_AB
MED_grid_AB = MED_AB_final;
MICD_grid_AB = classify_grid_by_MICD(class_data, X, Y);
MAP_grid_AB = classify_grid_by_MAP(class_data, X, Y);
figure;
contour(X, Y, MED_grid_AB, 'yellow');
hold on;
contour(X, Y, MICD_grid_AB, 'green');
contour(X, Y, MAP_grid_AB, 'blue');
plot_error_variance(classes{1}, 10, {'r'});
plot_error_variance(classes{2}, 10, {'k'});
plot_scatter(samples, {});
legend('MED Boundary', 'MICD Boundary', 'MAP Boundary', 'U.S.D. Contour A', 'U.S.D. Contour B', clsA('name'), clsB('name'));
title('3. CASE 1: MED/MICD/MAP Boundaries');
hold off;

% % CASE 2: C vs D vs D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
class_data = {clsC('mu'), clsC('sigma'), clsC('N');
              clsD('mu'), clsD('sigma'), clsD('N'); 
              clsE('mu'), clsE('sigma'), clsE('N')};
%MED_grid_CDE
MED_CD = classify_grid_by_MED(classes{3}('mu'), classes{4}('mu'), X, Y);
MED_DE = classify_grid_by_MED(classes{4}('mu'), classes{5}('mu'), X, Y);
MED_EC = classify_grid_by_MED(classes{5}('mu'), classes{3}('mu'), X, Y);
MED_CDE_final = zeros(size(X, 1), size(Y, 2));
for i=1:size(X,1)
    for j=1:size(Y,2)
        if MED_CD(i,j) >= 0 && MED_DE(i,j) <= 0
            MED_CDE_final(i,j) = 1;
        elseif MED_CD(i,j) <= 0 && MED_EC(i,j) >= 0
            MED_CDE_final(i,j) = 2;
        elseif MED_DE(i,j) >= 0 && MED_EC(i,j) <= 0
            MED_CDE_final(i,j) = 3;
        else
            disp('Error creating MED_CDE_final...');
        end
    end
end
%MED_grid_CDE
MED_grid_CDE = MED_CDE_final;
MICD_grid_CDE = classify_grid_by_MICD(class_data, X, Y);
MAP_grid_CDE = classify_grid_by_MAP(class_data, X, Y);
figure;
contour(X, Y, MED_grid_CDE, 'yellow');
hold on;
contour(X, Y, MICD_grid_CDE, 'green');
contour(X, Y, MAP_grid_CDE, 'blue');
plot_error_variance(classes{3}, 10, {'r'});
plot_error_variance(classes{4}, 10, {'k'});
plot_error_variance(classes{5}, 10, {'m'});
plot_scatter(samples, {});
legend('MED Boundary', 'MICD Boundary', 'MAP Boundary', 'U.S.D. Contour C', 'U.S.D. Contour D', 'U.S.D. Contour E', clsC('name'), clsD('name'), clsE('name'));
title('3. CASE 2: MED/MICD/MAP Boundaries');
hold off;