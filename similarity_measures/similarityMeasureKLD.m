function sim = similarityMeasureKLD(feature1,feature2)
% This function computes the similarity score using KL Divergence
% between 2 feature vectors of identical dimensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% feature1, feature2: 2 scalars, vectors, multidimensional arrays of
% identical dimensions

% Output
% features: a scalar showing the similarity score between the 2 
% feature vectors using KL divergence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Take softmax to convert feature vectors into 'pseudo probabilities'
feature1 = exp(feature1)/sum(exp(feature1)); 
feature2 = exp(feature2)/sum(exp(feature2));

% This code avoids overflow or inf values
epsilon = 0.00001;  
feature1 = feature1 + epsilon;  
feature2 = feature2 + epsilon;

sim = sum(feature1 .* log(feature1./feature2));

end

