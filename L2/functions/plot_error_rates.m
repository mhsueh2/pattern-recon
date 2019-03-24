function plot_error_rates(errors_list)
    plot_types = {
        'Average Error Rate',...
        'Minimum Error Rate',...
        'Maximum Error Rate',... 
        'Standard Deviation of Error Rate'};
    [avg_err, min_err, max_err, std_err] = deal([],[],[],[]);
    
    for i=1:length(errors_list)
        avg_err = [avg_err mean(errors_list{i})];
        min_err = [min_err min(errors_list{i})];
        max_err = [max_err max(errors_list{i})];
        std_err = [std_err std(errors_list{i})];
    end
    processed_errs = {avg_err, min_err, max_err, std_err};
    
    figure;
    for i=1:length(plot_types)
        subplot(length(plot_types),1,i);
        plot(1:length(errors_list), processed_errs{i}, 'o-','linewidth',2,'markersize',5,'markerfacecolor','r');
        title(plot_types(i));   
    end
end