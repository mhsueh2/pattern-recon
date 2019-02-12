
function  grid_ = classify_grid_by_MICD(class_data, X, Y)
    % % Evaluates the samples and classify  points on the grid to get boundry
    % % Input: class_data: mu, sigma; meshed X and Y
    % % Returns a xy cordinates requried to plot the boundry
        size_ = size(X);
        x_range = size_(1, 1);
        y_range = size_(1, 2);
        grid_ = zeros(x_range, y_range);
        num_classes = size(class_data);
        num_classes = num_classes(1);
        
        for grid_index=1:numel(X)   
            [x, y] = deal(X(grid_index), Y(grid_index));
            p = [x, y];
            discrim = zeros(1, num_classes);
            
            for cur_class=1:num_classes
                mu = class_data{cur_class, 1};
                sigma = class_data{cur_class, 2};
                discrim(1, cur_class) = (p-mu)*inv(sigma)*transpose((p-mu));
            end
            
            [min_dist,min_index] = min(discrim);
            grid_(grid_index) = min_index; 
        end
end
