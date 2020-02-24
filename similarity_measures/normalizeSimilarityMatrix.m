function normalized_SM = normalizeSimilarityMatrix(SimilarityMatrix)
% NORMALIZESIMILARITYMATRIX normalizes the similarity Matrix to have values
% between 0 and 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Input
%   SimilarityMatrix: Similarity Matrix computed with a measure that computes
%   dissimilarity and values in range [0, inf). e.g. MSE
%
%   Output
%   normalized_SM: Normalized Similarity Matrix that has values between 0
%   and 1, where 1 is a perfect match, and 0 means a very poor match.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compute maximum similarity in each row
max_rows = max(SimilarityMatrix, [], 2); 

% Replicate the column vector horizontally                                         
max_rows = repmat(max_rows,1,size(SimilarityMatrix,1));

% Normalize and subtract from 1 to turn matrix to a proper SImilarity
% Matrix
normalized_SM = 1 - SimilarityMatrix./max_rows;

end

