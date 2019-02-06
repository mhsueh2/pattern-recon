% gen_cluster: Generates a cluster of uncorellated data
% Author: Martin Hsueh
% INPUTS:
% N - Sample size
% mu - Means
% sigma - Covariance
% 
% OUTPUT:
% cluster - A cluster of size N x length(mu)
%
% Returns a cluster of uncorrelated data
function cluster = gen_cluster( N, mu, sigma )
R = chol(sigma);
cluster = repmat(mu,N,1) + randn(N,length(mu))*R;
end


