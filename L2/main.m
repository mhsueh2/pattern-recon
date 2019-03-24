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
LIMIT = inf;
PLOT_BOUNDRY = true;
PLOT_ERRS = false;

for i=1:3
    run('sequential_classifier.m')
end

% Compute 5 sequentail discriminatns and plot the error rates
J = 5;
LIMIT = 20;
PLOT_BOUNDRY = false;
PLOT_ERRS = true;

run('sequential_classifier.m')

% Show answers for 1D estimation
table(Section, Answer)