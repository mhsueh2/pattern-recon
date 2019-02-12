
function  grid_ = classify_grid_by_MAP(class_data, X, Y)
    % % Evaluates the samples and classify  points on the grid to get boundry
    % % Input: class_data: mu, sigma; meshed X and Y
    % % Returns a xy cordinates requried to plot the boundry
        size_ = size(X);
        x_range = size_(1, 1);
        y_range = size_(1, 2);
        grid_ = zeros(x_range, y_range);
        num_classes = size(class_data);
        num_classes = num_classes(1);
        
        % Create class probabilities
        total_samples = 0;
        for cur=1:num_classes
            total_samples = total_samples + class_data{cur, 3};
        end
        probabilities = zeros(1, num_classes);
        for cur=1:num_classes
            probabilities(1, cur) = class_data{cur, 3}/total_samples;
        end
        
        % Calculate point's probability
        for grid_index=1:numel(X)   
            [x, y] = deal(X(grid_index), Y(grid_index));
            p = [x, y];
            prob = zeros(1, num_classes);
            
            for cur=1:num_classes
                mu = class_data{cur, 1};
                sigma = class_data{cur, 2};
                P = probabilities(1, cur);
                prob(1, cur) = (P*exp(-0.5*(p-mu)*inv(sigma)*transpose((p-mu))))/(det(sigma)^0.5);
            end
            
            [max_prob,max_index] = max(prob);
            grid_(grid_index) = max_index; 
        end
end