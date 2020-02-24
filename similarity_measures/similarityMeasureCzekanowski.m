function sim = similarityMeasureCzekanowski(feature1,feature2)
% This function computes the similarity score using mean square error
% between 2 feature vectors of identical dimensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% feature1, feature2: 2 scalars, vectors, multidimensional arrays of
% identical dimensions

% Output
% features: a scalar showing the similarity score between the 2 
% feature vectors using the Czekanowski Similarity Measure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Insert your code here

sim = 1 - (norm(feature1 - feature2,1)/norm(feature1 + feature2,1));
end

