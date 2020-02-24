function sim = imageSimilarityScore(img1,img2)
% Given 2 input images, this function extracts features from them and uses 
% these to compute a similarity metric
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% img1, img2: Two images of equal dimesions
%
% Output
% sim: A scalar value showing the similarity between the two images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extract features from 1st image
%feature1 = feature_extractor_intensity(img1);
%feature1 = feature_extractor_LBP(img1);
%feature1 = feature_extractor_DFT(img1);
%feature1 = feature_extractor_DCT(img1);
feature1 = feature_extractor_Curvelet(img1);

% Extract features from 2nd image
%feature2 = feature_extractor_intensity(img2);
%feature2 = feature_extractor_LBP(img2);
%feature2 = feature_extractor_DFT(img2);
%feature2 = feature_extractor_DCT(img2);
feature2 = feature_extractor_Curvelet(img2);

% Compute the similarity metric using the two feature vectors
%sim = similarityMeasureMSE(feature1, feature2);
%sim = similarityMeasureKLD(feature1, feature2);
sim = similarityMeasureCzekanowski(feature1, feature2);

end

