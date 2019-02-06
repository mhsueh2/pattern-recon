clear all; close all; clc;

% Generating Clusters
% % 1. Generates uncorrelate clusters
clsA = gen_cluster(200, [5 10], [8 0;0 4]);
clsB = gen_cluster(200, [10 15], [8 0;0 4]);
clsC = gen_cluster(100, [5 10], [8 4;4 40]);
clsD = gen_cluster(200, [15 10], [8 0;0 8]);
clsE = gen_cluster(150, [10 5], [10 -5;-5 20]);

% % 2. Plot samples
% % % Plot Samples and Unit standard deviation contours
v = var(clsA);
cov = [0 v(:,1);v(:,2) 0];
plot_scatter({clsA},{'Class A'})
plotErrorEllipse(mean(clsA), cov, 10);
legend('Class A Data', 'Covariance Error')


% % % Plot A vs B
plot_scatter({clsA,clsB},{'Class A', 'Class B'})
% % % Plot C vs D vs E
plot_scatter({clsC,clsD,clsE},{'Class C', 'Class D', 'Class E'})

% Plot Decision Boundries
% % MED

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
    figure;
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

