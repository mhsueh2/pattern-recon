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

function cluster = gen_cluster( N, mu, sigma )
    Trans = chol(sigma);
    cluster = repmat(mu,N,1) + randn(N,length(mu))*Trans;
end