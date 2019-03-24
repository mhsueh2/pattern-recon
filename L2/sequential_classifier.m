%% Set given parameters, load data and define grid
addpath('functions/');
addpath('data/');

% Loads 2 Class of Data A and B
load('lab2_3.mat');
cls_key = {'a','b'};
cls_id = [1, 2];
cls_map = containers.Map(cls_key,cls_id);

% Define grid
resolution = 1;

min_x = min([min(a(:,1)) min(b(:,1))]) - resolution;
max_x = max([max(a(:,1)) max(b(:,1))]) + resolution;
min_y = min([min(a(:,2)) min(b(:,2))]) - resolution;
max_y = max([max(a(:,2)) max(b(:,2))]) + resolution;
x_range = min_x:resolution:max_x;
y_range = min_y:resolution:max_y;
[X,Y] = meshgrid(x_range, y_range);

%% Compute Sequential Discrimnants with MED Classifier
subset_a = a;
subset_b = b;
discriminant_list = {};
n_ab_list = {};
n_ba_list = {};
error_rates_list = {};
j = 0;
while( j < J && ~isempty(subset_a) && ~isempty(subset_b))
    iter_index = 0;
    valid_discriminate = false;
    [n_ab, n_ba] = deal(zeros(1), zeros(1));
    error_rates = [];
    while(~isempty(n_ab) && ~isempty(n_ba) && iter_index < LIMIT)
        rd_row_a = randi(size(subset_a,1), 1);
        rd_row_b = randi(size(subset_b,1), 1);
        prot_a = subset_a(rd_row_a, :);
        prot_b = subset_b(rd_row_b, :);

        G = classify_by_MED(prot_a, prot_b, X, Y);
        [n_aa, n_ab] = evaluate_predictions(subset_a, G, X, Y, cls_map('a'));
        [n_bb, n_ba] = evaluate_predictions(subset_b, G, X, Y, cls_map('b'));
        
        err_rate = (length(n_ab)+length(n_ba))/400;
        error_rates = [error_rates err_rate];
        iter_index = iter_index + 1;
    end
    
    discriminant_list{end+1} = G;
    n_ab_list{end+1} = n_ab;
    n_ba_list{end+1} = n_ba;
    error_rates_list{end+1} = error_rates;
            
    if isempty(n_ab); subset_b = remove_correct(subset_b, n_bb); end
    if isempty(n_ba); subset_a = remove_correct(subset_a, n_aa); end
    j = j+1;
end

if PLOT_BOUNDRY
    grid_SC = classify_by_SC(discriminant_list, n_ab_list, n_ba_list, cls_map);
    title_ = 'Sequential Classifier Decision Boundry';
    plot_boundry(grid_SC, X, Y, {a,b}, title_, title_)
end

if PLOT_ERRS
    plot_error_rates(error_rates_list)
end

function set_ = remove_correct(set_, correct_points_rows)
    % Starts at the last row to avoid row index mutation within set
    for i=length(correct_points_rows):-1:1
        set_(correct_points_rows(i),:) = [];
    end
end
