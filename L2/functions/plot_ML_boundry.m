function plot_ML_boundry(grid, X, Y, A, B, C, title_)
    legends = {'ML Decision Boundry', "Class A", "Class B", 'Class C'};
    
    figure;
    contour(X, Y, grid, 'b');
    hold on;
    plot_scatter({A, B, C}, legends);
    title(title_);
    hold off;
end
