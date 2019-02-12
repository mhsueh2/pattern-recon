% % 2. Plot samples
% % % Plot Samples and Unit standard deviation contours
figure;
for i=1:length(classes)
    subplot(length(classes), 1, i);
    name = classes{i}('name');
    sample = classes{i}('sample');
    plot_scatter({sample}, {});
    plot_error_variance(classes{i}, 10, {'r'});
    legend(name, 'Covariance Error');
    hold off;
end

% % % Plot A vs B
figure;
plot_scatter({sample_A,sample_B},{'Class A', 'Class B'})

% % % Plot C vs D vs E
figure;
plot_scatter({sample_C,sample_D,sample_E},{'Class C', 'Class D', 'Class E'})