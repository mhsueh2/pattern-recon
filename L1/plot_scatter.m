function plot_scatter( classes, legends)
    sz = 5;
    for i=1:length(classes)
        x = classes{i}(:,1);
        y = classes{i}(:,2);
        scatter(x,y,sz,'filled');
        hold on;
    end
    legend(legends)
end
