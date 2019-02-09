% % A VS B
k = 1;
samples = {sample_A, sample_B};
[X, Y] = create_2d_grid(samples, resolution);
NN_grid_AB = classify_grid_by_kNN(samples, X, Y, k);
figure;
contourf(X, Y, NN_grid_AB);
hold on;
plot_scatter(samples, {'Class Boundries', clsA('name'), clsB('name')});
hold off;

% % C VS D VS D
samples = {sample_C, sample_D, sample_E};
[X, Y] = create_2d_grid(samples, resolution);
NN_grid_CDE = classify_grid_by_kNN(samples, X, Y, k);
figure;
contourf(X, Y, NN_grid_CDE);
hold on;
plot_scatter(samples, {'Class Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;

function  grid_ = classify_grid_by_kNN(samples, X, Y, k)
% % Evaluates the samples and classify  points on the grid to get boundry
% % Input: samples: Array of samples; meshed X and Y, k number of neighbours
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
            k_min_d = inf(1, length(k))
            for j=1:N
                vector = [p;samp(j,:)];
                d = round(pdist(vector,'euclidean'),5);
                for i_m=1:k
                    if d <= k_min_d(i_m)
                        temp = k_min_d(i_m);
                        k_min_d(i_m) = d;
                        d = temp;
                    end
                end
            end
            min_distances(i) = mean(k_min_d)
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
