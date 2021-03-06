function plot_error_rates(errors_list)
    plot_types = {
        'Average Error Rate',...
        'Minimum Error Rate',...
        'Maximum Error Rate',... 
        'Standard Deviation of Error Rate'};
    [avg_err, min_err, max_err, std_err] = deal([],[],[],[]);
    
    N = length(errors_list);
    J = length(errors_list{1});
    for j=1:J
        errs = zeros(1, N);
        for i=1:length(errors_list)
            errs(i) = errors_list{i}(j);
        end
        
        avg_err = [avg_err mean(errs)];
        min_err = [min_err min(errs)];
        max_err = [max_err max(errs)];
        std_err = [std_err std(errs)];
    end
    processed_errs = {avg_err, min_err, max_err, std_err};
    
    figure;
    for i=1:length(plot_types)
        subplot(length(plot_types),1,i);
        plot(1:J, processed_errs{i}, 'o-','linewidth',2,'markersize',5,'markerfacecolor','r');
        title(plot_types(i));   
    end
end