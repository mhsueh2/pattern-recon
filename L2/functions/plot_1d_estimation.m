function plot_1d_estimation( data, x_range, true_p, est_p, title_ )
    y = zeros(size(data));
    
    figure();
    hold on;
    scatter(data,y, 'k');
    plot(x_range,true_p, 'r');
    plot(x_range,est_p, 'b');
    title(title_);
    legend('Data', 'True Probability', 'Estimated Probability')
    grid on;
    hold off;
end
