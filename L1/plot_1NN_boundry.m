% % A VS B
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
NN_grid_AB = classify_grid_by_NN(samples, X, Y);
figure;
contourf(X, Y, NN_grid_AB);
hold on;
plot_scatter(samples, {'Class Boundries', clsA('name'), clsB('name')});
hold off;

% % C VS D VS D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
NN_grid_CDE = classify_grid_by_NN(samples, X, Y);
figure;
contourf(X, Y, NN_grid_CDE);
hold on;
plot_scatter(samples, {'Class Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;

function  grid_ = classify_grid_by_NN(samples, X, Y)
% % Evaluates the samples and classify  points on the grid to get boundry
% % Input: samples: Array of samples; size: size of grid
% % Returns a xy cordinates requried to plot the boundry
    size_ = size(X);
    x_range = size_(1,1);
    y_range = size_(1,2);
    grid_ = zeros(x_range, y_range);

    for grid_index=1:numel(X)   
        [x, y] = deal(X(grid_index), Y(grid_index));
        p = [x, y]
        min_distances = inf(1, length(samples));
        
        for i=1:length(min_distances)
            samp = samples{i};
            N = length(samp);
            for j=1:N
                vector = [p;samp(j,:)];
                d = round(pdist(vector,'euclidean'),5);
                if d < min_distances(i), min_distances(i) = d; end
            end
        end

        if length(min_distances) == length(unique(min_distances))
            [min_, min_index] = deal(inf, 0);
            for i=1:length(min_distances)
                if min_distances(i) < min_
                    min_ = min_distances(i);
                    min_index = i;
                end
            end
            grid_(grid_index) = min_index;
        end
    end
end
