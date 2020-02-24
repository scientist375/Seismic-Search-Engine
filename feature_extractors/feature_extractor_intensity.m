function features = feature_extractor_intensity(img)
% This function extracts the MSE feature for similarity-based retrieval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% img: a 2-D array

% Output
% features: a 2-D array same size as img
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

features = img;  % MSE returns the original image as a feature

% Uncomment the following line if you want to perform SVD truncation on the features
% features = svd_trunc(features, 0.5);  % Retains half of the highest singular values

end

