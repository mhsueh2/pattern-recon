clear all; close all; clc;

% Define the Classes {N, True Mean, True Variance}
keys = {'N', 'mu', 'sigma', 'name'};
clsA = containers.Map(keys, {200, [5 10], [8 0;0 4], 'Class A'}, 'UniformValues',false);
clsB = containers.Map(keys, {200, [10 15], [8 0;0 4], 'Class B'},'UniformValues',false);
clsC = containers.Map(keys, {100, [5 10], [8 4;4 40], 'Class C'},'UniformValues',false);
clsD = containers.Map(keys, {200, [15 10], [8 0;0 8], 'Class D'},'UniformValues',false);
clsE = containers.Map(keys, {150, [10 5], [10 -5;-5 20], 'Class E'},'UniformValues',false);

classes = {clsA, clsB, clsC, clsD, clsE};

% Generating Clusters
% % 1. Generates uncorrelate clusters
for i=1:length(classes)
    class = classes{i};
    class('sample') = gen_cluster(class('N'), class('mu'), class('sigma'));
end

[sample_A, sample_B, sample_C, sample_D, sample_E] = deal( ...
classes{1}('sample'),classes{2}('sample'),classes{3}('sample'), ... 
classes{4}('sample'),classes{5}('sample'));

% % 2. Plot samples
% % % Plot Samples and Unit standard deviation contours
figure;
for i=1:length(classes)
    subplot(length(classes), 1, i);
    name = classes{i}('name');
    sample = classes{i}('sample');
    plot_scatter({sample}, {});
    plot_error_variance(classes{i}, 10);
    legend(name, 'Covariance Error');
    hold off;
end

% % % Plot A vs B

figure;
plot_scatter({sample_A,sample_B},{'Class A', 'Class B'})

% % % Plot C vs D vs E
figure;
plot_scatter({sample_C,sample_D,sample_E},{'Class C', 'Class D', 'Class E'})

% Plot Decision Boundries
% % MED


% % NN For A VS B
NN_boundry = get_NN_boundry({sample_C, sample_D, sample_E});
figure;
plot_scatter({sample_C, sample_D, sample_E},{'Class A', 'Class B'})
plot(NN_boundry(:,1), NN_boundry(:,2))

function NN_boundry = get_NN_boundry(samples)
% % Evaluates the samples and classify  points on the grid to get boundry
% % Input: samples: Array
% % Returns a xy cordinates requried to plot the boundry
    [max_x, max_y, min_x, min_y] = get_min_and_max(samples)

    NN_boundry = zeros(10000000, 2);
    tracker = 0;

    for x_=min_x:0.1:max_x
        for y_=min_y:0.1:max_y
            p = [x_ y_]
            min_distances = inf(1, length(samples));
            for i=1:length(min_distances)
                samp = samples{i};
                N = length(samp);
                for j=1:N
                    vector = [p;samp(j,:)];
                    d = round(pdist(vector,'euclidean'),1);
                    if d < min_distances(i), min_distances(i) = d; end
                end
            end
            
            if length(min_distances) > length(unique(min_distances))
                tracker = tracker +1;
                NN_boundry(tracker,:) = p;     
            end

        end
    end

    NN_boundry = NN_boundry(1:tracker,1:2);
end

function [max_x, max_y, min_x, min_y] = get_min_and_max(samples)
% % Get min and max for an array of samples of N*2 matrix
% % Input: Samples: Array 
    [x_col, y_col] = deal(1, 2);
    [max_x, max_y] = deal(-inf);
    [min_x, min_y] = deal(inf);

    for i=1:length(samples)
        s = samples{i};
        max_x = max(max_x, max(s(:,x_col)));
        max_y = max(max_y, max(s(:,y_col)));
        min_x = min(min_x, min(s(:,x_col)));
        min_y = min(min_y, min(s(:,y_col)));
    end
end

function plot_error_variance(class, p)
    mu = class('mu');
    sigma = class('sigma');
    plotErrorEllipse(mu, sigma, p);
end

function plotErrorEllipse(mu, Sigma, p)
    s = -2 * log(1 - p);

    [V, D] = eig(Sigma * s);

    t = linspace(0, 2 * pi);
    a = (V * sqrt(D)) * [cos(t(:))'; sin(t(:))'];

    plot(a(1, :) + mu(1), a(2, :) + mu(2));
end

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

function cluster = gen_cluster( N, mu, sigma )
Trans = chol(sigma);
cluster = repmat(mu,N,1) + randn(N,length(mu))*Trans;
end

