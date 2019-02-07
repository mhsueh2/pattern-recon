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
sample_A = classes{1}('sample');
sample_B = classes{2}('sample');
figure;
plot_scatter({sample_A,sample_B},{'Class A', 'Class B'})

% % % Plot C vs D vs E
sample_C = classes{3}('sample');
sample_D = classes{4}('sample');
sample_E = classes{5}('sample');
figure;
plot_scatter({sample_C,sample_D,sample_E},{'Class C', 'Class D', 'Class E'})

% Plot Decision Boundries
% % MED

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
% This routine plots an ellipse with centre (x,y), axis lengths a,b
% with major axis at an angle of theta radians from the horizontal.
function plot_ellipse(x,y,theta,a,b)
    if nargin<5, error('Too few arguments to Plot_Ellipse.'), end

    np = 100;
    ang = [0:np]*2*pi/np;
    pts = [x;y]*ones(size(ang)) + [cos(theta) -sin(theta); sin(theta) cos(theta)]*[cos(ang)*a; sin(ang)*b];
    plot( pts(1,:), pts(2,:) );
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

