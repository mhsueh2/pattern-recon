%% Set given parameters, load data and define grid
addpath('functions/');
addpath('data/');

% Loads 3 Classes of 2D data al, bl and cl
load('lab2_2.mat');

% Define grid
resolution = 1;
min_x = min([min(al(:,1)) min(bl(:,1)) min(cl(:,1))]) - resolution;
max_x = max([max(al(:,1)),max(bl(:,1)),max(cl(:,1))]) + resolution;
min_y = min([min(al(:,2)),min(bl(:,2)),min(cl(:,2))]) - resolution;
max_y = max([max(al(:,2)),max(bl(:,2)),max(cl(:,2))]) + resolution;
x_range = min_x:resolution:max_x;
y_range = min_y:resolution:max_y;
[X,Y] = meshgrid(x_range, y_range);

%% Classify Grid With ML Using Gaussian PDF
P_A = compute_pdf_grid_gaussian(al, X, Y);
P_B = compute_pdf_grid_gaussian(bl, X, Y);
P_C = compute_pdf_grid_gaussian(cl, X, Y);

clsfied_grid = classify_by_ML(P_A, P_B, P_C);
title_ = 'ML Classification Using Gaussian PDF';
plot_ML_boundry(clsfied_grid, X, Y, at, bt, ct, title_);

%% Classify Grid With ML Using Parzen PDF
% Define required parameters, Gaussian Parzen Window and Parzen resolution
var = 400;
mu = [var/2 var/2];
cov = [var 0; 0 var];
[X, Y] = meshgrid(1:resolution:var);
win = reshape(mvnpdf([X(:) Y(:)], mu, cov), length(X), length(Y));
parzen_res = [resolution min_x min_y max_x max_y];

[P_A, x_range, y_range] = compute_pdf_grid_parzen(al,parzen_res, win);
[P_B, x_range, y_range] = compute_pdf_grid_parzen(bl,parzen_res, win);
[P_C, x_range, y_range] = compute_pdf_grid_parzen(cl,parzen_res, win);

[X, Y] = meshgrid(x_range, y_range);
clsfied_grid = classify_by_ML(P_A, P_B, P_C);
title_ = 'ML Classification Using Parzen PDF';
plot_ML_boundry(clsfied_grid, X, Y, at, bt, ct, title_);



