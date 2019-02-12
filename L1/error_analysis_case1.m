% Define Data 
cls_data_c1 = {clsA('mu'), clsA('sigma'), clsA('N'); 
              clsB('mu'), clsB('sigma'), clsB('N')};
cls_data_c2 = {clsC('mu'), clsC('sigma'), clsC('N');
              clsD('mu'), clsD('sigma'), clsD('N'); 
              clsE('mu'), clsE('sigma'), clsE('N')};
case1_samps = {sample_A, sample_B};
case2_samps = {sample_C, sample_D, sample_E};

if exist('MED_AB_final', 'var') == 0 || exist('MED_CDE_final', 'var') == 0
    run('classify_grid_by_MED.m');
end

[X_1, Y_1] = create_2d_grid(case1_samps, resolution);
[X_2, Y_2] = create_2d_grid(case2_samps, resolution);

% Case grid classification
MAP_c1 = classify_grid_by_MAP(cls_data_c1, X_1, Y_1);
MAP_c2 = classify_grid_by_MAP(cls_data_c2, X_2, Y_2);

MED_c1 = MED_AB_final;
MED_c2 = MED_CDE_final;

MICD_c1 = classify_grid_by_MICD(cls_data_c1, X_1, Y_1);
MICD_c2 = classify_grid_by_MICD(cls_data_c2, X_2, Y_2);

% Load kNN_grids.mat first 
NN_c1 = NN_grid_c1;
NN_c2 = NN_grid_c2;

five_NN_c1 = five_NN_grid_c1;
five_NN_c2 = five_NN_grid_c2;


% Get Errors for Case 1
% % % % % 
[TA, FA] = get_error_c1(sample_A, MAP_c1, 1, X_1, Y_1);
[TB, FB] = get_error_c1(sample_B, MAP_c1, 2, X_1, Y_1);

confusion_mtx = [
    [TA, FB];
    [FA, TB];
];
disp('Confusion matrix MAP Case 1:');
disp(confusion_mtx);

P_error_1 = (FA + FB)/(length(sample_A) + length(sample_B));

disp('P_error for MAP Case 1:');
disp(P_error_1);
% % % % % 
% % % % % 
[TA, FA] = get_error_c1(sample_A, MED_c1, 1, X_1, Y_1);
[TB, FB] = get_error_c1(sample_B, MED_c1, 2, X_1, Y_1);

confusion_mtx = [
    [TA, FB];
    [FA, TB];
];
disp('Confusion matrix MED Case 1:');
disp(confusion_mtx);

P_error_1 = (FA + FB)/(length(sample_A) + length(sample_B));

disp('P_error for MED Case 1:');
disp(P_error_1);

% % % % % 
% % % % % 
[TA, FA] = get_error_c1(sample_A, MICD_c1, 1, X_1, Y_1);
[TB, FB] = get_error_c1(sample_B, MICD_c1, 2, X_1, Y_1);

confusion_mtx = [
    [TA, FB];
    [FA, TB];
];
disp('Confusion matrix MICD Case 1:');
disp(confusion_mtx);

P_error_1 = (FA + FB)/(length(sample_A) + length(sample_B));

disp('P_error for MICD Case 1:');
disp(P_error_1);

% % % % % 
% % % % % 
[TA, FA] = get_error_c1(sample_A, NN_c1, 1, X_1, Y_1);
[TB, FB] = get_error_c1(sample_B, NN_c1, 2, X_1, Y_1);

confusion_mtx = [
    [TA, FB];
    [FA, TB];
];
disp('Confusion matrix 1NN Case 1:');
disp(confusion_mtx);

P_error_1 = (FA + FB)/(length(sample_A) + length(sample_B));

disp('P_error for 1NN Case 1:');
disp(P_error_1);
% % % % % 
% % % % % 
[TA, FA] = get_error_c1(sample_A, five_NN_c1, 1, X_1, Y_1);
[TB, FB] = get_error_c1(sample_B, five_NN_c1, 2, X_1, Y_1);

confusion_mtx = [
    [TA, FB];
    [FA, TB];
];
disp('Confusion matrix 5NN Case 1:');
disp(confusion_mtx);

P_error_1 = (FA + FB)/(length(sample_A) + length(sample_B));

disp('P_error for 5NN Case 1:');
disp(P_error_1);


function [ correct, incorrect ] = get_error_c1( samp, grid_, expected_cls, X, Y)    
    correct = 0;
    N = length(samp);

    for i=1:N
        correct = correct + is_in_bound(samp(i,:), grid_,X, Y, expected_cls);
    end
    
    incorrect = N - correct;
end

function [ result ] = is_in_bound( point, grid_, X, Y, expected_cls)
    res = 0.25;
    result = 0;
    [row, col] = size(grid_);
    [x,y,x_min, y_min] = deal(point(1), point(2), X(1), Y(1));
    x_index = round((x-x_min)/res) + 1;
    y_index = round((y-y_min)/res) + 1;
    
    if x_index > col, x_index = x_index -1; end
    if y_index > row, y_index = y_index-1; end
    
    boundary_cls = grid_(y_index, x_index);
    if boundary_cls == expected_cls
        result = 1;
    end
end
