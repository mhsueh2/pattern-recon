function [max_x, max_y, min_x, min_y] = get_range(samples)
    % % Get min and max for an array of samples of N*2 matrix
    % % Input: Samples: Array 
        [x_col, y_col] = deal(1, 2);
        [max_x, max_y] = deal(-inf);
        [min_x, min_y] = deal(inf);
    
        for i=1:length(samples)
            s = samples{i};
            max_x = max(max_x, max(s(:,x_col)));
            max_y = max(max_y, max(s(:,y_col)));
            min_x = min(min_x, min(s(:,x_col)));
            min_y = min(min_y, min(s(:,y_col)));
        end
    end