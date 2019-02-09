function [X, Y] = create_2d_grid( samples , resolution)
    [max_x, max_y, min_x, min_y] = get_range(samples);
    x_range = min_x:resolution:max_x;
    y_range = mini_y:resolution:max_y;

    [X, Y] = meshgrid(x_range, y_range)
end