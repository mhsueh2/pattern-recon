% % % Sets config, load functions, loads 1D and 2D estimations and the 
% % sequential discrimanats
clear; close all; clc; path(pathdef);

resolution = 0.01;
run('one_d_estimation.m');
run('two_d_estimation.m');