function plot_scatter( classes, legends)
    sz = 30;
    markers = {'o','X','s','+'};
    colors = {'r','k','m'};
    for i=1:length(classes)
        x = classes{i}(:,1);
        y = classes{i}(:,2);
        markers{i};
        scatter(x,y,sz,colors{i},markers{i});
        hold on;
    end
    legend(legends)
end
