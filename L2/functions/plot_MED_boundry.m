function plot_MED_boundry(grid, X, Y, A, B, title_)
    legends = {'MED Decision Boundry', "Class A", "Class B"};

    figure;
    contour(X, Y, grid, 'b');
    hold on;
    plot_scatter({A, B}, legends);
    title(title_);
    hold off;
end
