% Define Data 
cls_data_c1 = {clsA('mu'), clsA('sigma'), clsA('N'); 
              clsB('mu'), clsB('sigma'), clsB('N')};
cls_data_c2 = {clsC('mu'), clsC('sigma'), clsC('N');
              clsD('mu'), clsD('sigma'), clsD('N'); 
              clsE('mu'), clsE('sigma'), clsE('N')};
case1_samps = {sample_A, sample_B};
case2_samps = {sample_C, sample_D, sample_E};

if exist('MED_AB_final') == 0 || exist('MED_CDE_final') == 0
    run('classify_grid_by_MED');
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
[TA, FA] = get_error_c1(sample_A, MAP_c1, 1);
[TB, FB] = get_error_c1(sample_B, MAP_c1, 2);

confusion_mtx_MAP = [
    [TA, FB];
    [FA, TB];
];
disp('Confusion matrix for A & B:');
disp(GED_conf_matrix_ab);

P_error_1 = (FA + FB)/(length(sample_A) + length(sample_B));

disp('P_error for A & B:');
disp(P_error_1);

%%%%%% Class 2 %%%%%%%
% combining the maps to classify every point
% GED_cd_sample_c = GED(covar_c, mu_c, covar_d, mu_d, samples_c);
% GED_de_sample_c = GED(covar_d, mu_d, covar_e, mu_e, samples_c);
% GED_ec_sample_c = GED(covar_e, mu_e, covar_c, mu_c, samples_c);


% GED_cd_sample_d = GED(covar_c, mu_c, covar_d, mu_d, samples_d);
% GED_de_sample_d = GED(covar_d, mu_d, covar_e, mu_e, samples_d);
% GED_ec_sample_d = GED(covar_e, mu_e, covar_c, mu_c, samples_d);


% GED_cd_sample_e = GED(covar_c, mu_c, covar_d, mu_d, samples_e);
% GED_de_sample_e = GED(covar_d, mu_d, covar_e, mu_e, samples_e);
% GED_ec_sample_e = GED(covar_e, mu_e, covar_c, mu_c, samples_e);

% cp = @classify_point;

% TC = 0;
% TD = 0;
% TE = 0;

% FD_C = 0;
% FE_C = 0;

% FC_D = 0;
% FE_D = 0;

% FC_E = 0;
% FD_E = 0;

% % Confusion matrix of the form:
% %       Predicted:    C       D     E
% % Actual:         C [ TC   FD_C  FE_C ]
% %                 D [ FC_D   TD  FE_D ]
% %                 E [ FC_E FD_E    TE ]

% for i = 1:length(samples_c)
%    class = cp(GED_cd_sample_c(i), GED_de_sample_c(i), GED_ec_sample_c(i));
%    if class == 1
%        TC = TC + 1;
%    elseif class == 2
%        FD_C = FD_C + 1;
%    elseif class == 3
%        FE_C = FE_C + 1;
%    end
% end

% for i = 1:length(samples_d)
%    class = cp(GED_cd_sample_d(i), GED_de_sample_d(i), GED_ec_sample_d(i));
%    if class == 1
%        FC_D = FC_D + 1;
%    elseif class == 2
%        TD = TD + 1;
%    elseif class == 3
%        FE_D = FE_D + 1;
%    end
% end

% for i = 1:length(samples_e)
%    class = cp(GED_cd_sample_e(i), GED_de_sample_e(i), GED_ec_sample_e(i));
%    if class == 1
%        FC_E = FC_E + 1;
%    elseif class == 2
%        FD_E = FD_E + 1;
%    elseif class == 3
%        TE = TE + 1;
%    end
% end

% GED_conf_matrix_cde = [
%     [TC, FD_C, FE_C];
%     [FC_D, TD, FE_D];
%     [FC_E, FD_E, TE];
% ];

% disp('Confusion matrix for C, D & E:');
% disp(GED_conf_matrix_cde);

% correct_2 = (TC + TE + TD) / (n_c + n_d + n_e);
% P_error_2 = 1 - correct_2;

% disp('P(error) for C, D & E:');
% disp(P_error_2);

function [ correct, incorrect ] = get_error_c1( samp, grid_, expected_cls)    
    correct = 0;
    N = length(samp)

    for i=1:N
        correct = correct + is_in_bound(samp(i,:), grid_, 1, expected_cls)
    end
    
    incorrect = N - correct;
end

function [ result ] = is_in_bound( point, grid_, case_, expected_cls)
    result = 0;
    [x,y] = deal(point(1), point(2));
    if case_ == 1
        x_min = X_1(1);
        y_min = Y_1(1);
    else
        x_min = X_2(1);
        y_min = Y_2(1);
    end

    grid_index = ((x-x_min)/resolution) * ((y-y_min)/resolution) + 1;

    if grid_(grid_index) == expected_cls
        result = 1;
    end
end