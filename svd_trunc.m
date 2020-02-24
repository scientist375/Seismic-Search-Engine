function out_features = svd_trunc(in_features, frac)
%SVD_TRUNC computes the SVD of the feature matrix given as input and keeps
%only the fraction of top singular values specified by frac
% Input
% in_features: input array to the function. Can be 1-D or 2-D
% frac: fraction between 0 and 1 that specifies how many of the largest 
% singular vlaues to keep
%
% Output:
% out_features: feature vector of truncated SVD values 

singular_values = svd(in_features);  % Compute the singular values
length_to_keep = ceil(frac*length(singular_values));
out_features = singular_values(1:length_to_keep);

end

