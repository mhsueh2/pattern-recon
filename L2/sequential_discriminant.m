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
n_range = [1 length(a)];

min_x = min([min(a(:,1)) min(b(:,1))]) - resolution;
max_x = max([max(a(:,1)) max(b(:,1))]) + resolution;
min_y = min([min(a(:,2)) min(b(:,2))]) - resolution;
max_y = max([max(a(:,2)) max(b(:,2))]) + resolution;
x_range = min_x:resolution:max_x;
y_range = min_y:resolution:max_y;
[X,Y] = meshgrid(x_range, y_range);

%% Compute Sequential Discrimnants with MED Classifier

for j=1:J
    iteration_index = 0;
    valid_discriminate = false;
    while( valid_discriminate == false)
        iteration_index = iteration_index + 1;
        rd_row_a = randi(n_range, 1);
        rd_row_b = randi(n_range, 1);
        prot_a = a(rd_row_a, :);
        prot_b = b(rd_row_b, :);

        G = classify_by_MED(prot_a, prot_b, X, Y);
        [n_aa, n_ba, n_bb, n_ab] = compute_2d_confusion_matrix(X, Y, G, a, b, cls_map);

        if n_ab == 0 || n_ba == 0
            valid_discriminate = true;
            
            if PLOT_BOUNDRY
                title = join(['Sequential Classifier #' string(j)]);
                plot_MED_boundry(G, X, Y, a, b, title)
            end
        end
    end
    
end

