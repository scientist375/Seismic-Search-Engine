function features = feature_extractor_LBP(img)
% This function extracts the LBP feature for similarity-based retrieval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% img: a 2-D array

% Output
% features: a 1-D array consisting of concatenated histograms of LBP
% patterns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extracts the histogram of LBP features
  features = extractLBPFeatures(img);
end

