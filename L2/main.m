% % % Sets config, load functions, loads 1D and 2D estimations and the 
% % sequential discrimanats
clear; close all; clc; path(pathdef);

Section = [];
Answer = [];

%% Estimations
run('one_d_estimation.m');
run('two_d_estimation.m');

%% Sequential Classification
% % % %  Set config for the script before exec
% % %  Required Settings:
% % Int J: # of classifiers
% % Int LIMIT: limit # of iteration to find a classifier
% % Bool PLOT_BDRY: Plot classifier boundry 
% % Bool PLOT_ERRS: Plot errors

% Compute 3 sequential classifiers and plot them
J = inf;
N = 3;
PLOT_BOUNDRY = true;
PLOT_ERRS = false;

run('sequential_classifier.m')

% Limit to 5 sequential discriminants, but learn each of them 20 times and plot the error rates
J = 5;
N = 20;
PLOT_BOUNDRY = false;
PLOT_ERRS = true;

run('sequential_classifier.m')

% Show answers for 1D estimation
table(Section, Answer)