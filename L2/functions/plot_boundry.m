function plot_boundry(grid, X, Y, classes, title_, classifier_)
    %% ascii code for A
    asci_ = 65;
  
    legends = {classifier_};
    for i=0:length(classes)-1
        legends{end+1} = "Class " + char(asci_+i);
    end

    figure;
    contour(X, Y, grid, 'b');
    hold on;
    plot_scatter(classes, legends);
    title(title_);
    hold off;
end
