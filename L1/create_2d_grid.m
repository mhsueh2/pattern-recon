function [X, Y] = create_2d_grid( samples , res)
    [max_x, max_y, min_x, min_y] = get_range(samples);
    x_range = min_x:res:max_x;
    y_range = min_y:res:max_y;

    [X, Y] = meshgrid(x_range, y_range);
end