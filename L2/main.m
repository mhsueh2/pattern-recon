% % % Sets config, load functions, loads 1D and 2D estimations and the 
% % sequential discrimanats
clear; close all; clc; path(pathdef);

%% Estimations
run('one_d_estimation.m');
run('two_d_estimation.m');

%% Set config for the script before exec
%  Required Settings:
% Int J: # of classifiers
% Int LIMIT: limit # of iteration to find a classifier
% Bool PLOT_BDRY: Plot classifier boundry 
% Bool PLOT_ERRS: Plot errrors

J = 3;
LIMIT = inf;
PLOT_BOUNDRY = true;
PLOT_ERRS = false;
run('sequential_discriminant.m')
