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
%plot_scatter({clsC,clsD,clsE},{'Class C', 'Class D', 'Class E'})

% % 3. Create Clasifiers
% % % 3.1 MED Classifier
% Calculate means
meanA = mean(clsA);
meanB = mean(clsB);
% means = [meanA; meanB]
% Calculate distance between means
% dist = pdist(means) % Default is euclidian
% Calculate midpoint between 2 means
midpoint = (meanA(:) + meanB(:)).'/2;
% Calculate slope of connecting line
m = (meanB(:,2) - meanA(:,2)) / (meanB(:,1) - meanA(:,1));
perpM = -1 / m;
line([meanA(:,1),meanB(:,1)],[meanA(:,2),meanB(:,2)]);
% Calulate perpendicular line to the line connecting the means
x = -15:0.25:25;
y = perpM*(x - midpoint(:,1)) + midpoint(:,2);
hPlot = plot(x,y,'DisplayName','Boundary AB');
% legend('Boundary AB');
axis equal;

% % % ----------------------------------------------------
plot_scatter({clsC,clsD,clsE},{'Class C', 'Class D', 'Class E'})

meanC = mean(clsC);
meanD = mean(clsD);
meanE = mean(clsE);
midpointCD = (meanC(:) + meanD(:)).'/2;
midpointDE = (meanD(:) + meanE(:)).'/2;
midpointEC = (meanE(:) + meanC(:)).'/2;
mCD = (meanD(:,2) - meanC(:,2)) / (meanD(:,1) - meanC(:,1));
mDE = (meanE(:,2) - meanD(:,2)) / (meanE(:,1) - meanD(:,1));
mEC = (meanC(:,2) - meanE(:,2)) / (meanC(:,1) - meanE(:,1));
perpCD = -1 / mCD;
perpDE = -1 / mDE;
perpEC = -1 / mEC;

line([meanC(:,1),meanD(:,1)],[meanC(:,2),meanD(:,2)]);
line([meanD(:,1),meanE(:,1)],[meanD(:,2),meanE(:,2)]);
line([meanE(:,1),meanC(:,1)],[meanE(:,2),meanC(:,2)]);

xCD = -15:0.01:25;
yCD = perpCD *(xCD - midpointCD(:,1)) + midpointCD(:,2);
% hPlot = plot(xCD,yCD,'DisplayName','Boundary CD');

xDE = -15:0.01:25;
yDE = perpDE *(xDE - midpointDE(:,1)) + midpointDE(:,2);
% hPlot = plot(xDE,yDE,'DisplayName','Boundary DE');

xEC = -15:0.01:25;
yEC = perpEC *(xEC - midpointEC(:,1)) + midpointEC(:,2);
% hPlot = plot(xEC,yEC,'DisplayName','Boundary EC');

intersection = InterX([xCD;yCD],[xDE;yDE]);
interX = intersection(1)
interY = intersection(2)

xCD = interX:0.01:25;
yCD = perpCD *(xCD - midpointCD(:,1)) + midpointCD(:,2);
hPlot = plot(xCD,yCD,'DisplayName','Boundary CD');

xDE = interX:0.01:25;
yDE = perpDE *(xDE - midpointDE(:,1)) + midpointDE(:,2);
hPlot = plot(xDE,yDE,'DisplayName','Boundary DE');

xEC = -15:0.01:interX;
yEC = perpEC *(xEC - midpointEC(:,1)) + midpointEC(:,2);
hPlot = plot(xEC,yEC,'DisplayName','Boundary EC');


% Need to cut the lines at the intersection point...

xlim([-10 30])
ylim([-10 30])
% axis equal;
% % % ----------------------------------------------------

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

