function [ data_est ] = estimate_1d_parzen( data, x_range, sigma )
    N = length(data);
    data_est = zeros(size(x_range));

    for x=1:length(x_range)
        x_sum = 0;
        for i=1:N
            x_sum = x_sum + normpdf(x_range(x), data(i), sigma);
        end
        data_est(x) = x_sum / N;
    end
end