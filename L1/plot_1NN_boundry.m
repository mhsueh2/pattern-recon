[X, Y] = create_2d_grid({sample_C, sample_D, sample_E})
NN_grid = get_NN_boundry({sample_C, sample_D, sample_E}, X, Y);
figure;
contourf(X, Y, NN_grid);
hold on;
plot(NN_boundry(:,1), NN_boundry(:,2));
hold off

function  grid_ = classify_grid_by_NN(samples, X, Y)
% % Evaluates the samples and classify  points on the grid to get boundry
% % Input: samples: Array of samples; size: size of grid
% % Returns a xy cordinates requried to plot the boundry
    x_range = size(X)(1,1);
    y_range = size(X)(1,2);
    grid_ = zeros(x_range, y_range)

    for x_=1:x_range
        for y_= 1:y_range
            p = [X(x_,y_) Y(x_,y_)]
            min_distances = inf(1, length(samples));
            for i=1:length(min_distances)
                samp = samples{i};
                N = length(samp);
                for j=1:N
                    vector = [p;samp(j,:)];
                    d = round(pdist(vector,'euclidean'),1);
                    if d < min_distances(i), min_distances(i) = d; end
                end
            end
            

            if length(min_distances) > length(unique(min_distances))
               grid_(p) = 0;
            else
                [min_, min_index] = deal(inf, 0);
                for i=1:length(min_distances)
                    if min_ < min_distances(i)
                        min_ = min_distances(i);
                        min_i = i;
                    end
                end
            end
        end
    end
end


