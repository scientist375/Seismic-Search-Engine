function sim = similarityMeasureMSE(feature1,feature2)
% This function computes the similarity score using mean square error
% between 2 feature vectors of identical dimensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% feature1, feature2: 2 scalars, vectors, multidimensional arrays of
% identical dimensions

% Output
% features: a scalar showing the (dis)similarity score between the 2 
% feature vectors using Mean Square Error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% In this case sim is actually the dissimilarity metric. Computes the 
% normalized MSE between the feature vectors
sim = sum((feature1 - feature2).^2, 'all') / numel(feature1);  

end

