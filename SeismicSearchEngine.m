%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Authors: Ghassan AlRegib, Ahmad Mustafa, and Chen Zhou
% Affiliation: CeGP, OLIVES Lab
% 
% About: 
% This script provides a skeleton of the similarity based workflow
% retrieval process for a given database of images as outlined in the
% project outline.
%
% Tasks:
% Go through this script and any other associated codes carefully. Complete 
% the missing portions as instructed in the project outline. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

addpath('feature_extractors')
addpath('similarity_measures')
addpath(genpath('CurveLab-2.1.2'))
%% Load the images
%load landmass images  (Uncomment the following two lines)
[images, NumOfClasses] = load_landmass(); % loads landmass images into a cell array called images  

% load mnist images  (Uncomment the following two lines)
%[images, NumOfClasses] = load_mnist(); % loads mnist images into a cell array called images 
%% Feature Extraction and Similarity Measurement
SimilarityMatrix = EvaluateSimilarityMatrix(images); % Provides an MxM matrix of similarity scores, where M is the 
                                               % number of images in the
                                               % database

%% Normalize the Similarity Matrix between 0 and 1 only if MSE or KLD used to compute Similarity measure between features
% Used if a similarity measure like MSE used where a higher score means
% images are more dissimilar                                                               
%SimilarityMatrix = normalizeSimilarityMatrix(SimilarityMatrix);  
%% Generate Retrieval Metrics and Plots

results = CalcStatistics(SimilarityMatrix,NumOfClasses);
fprintf('\n');
fprintf('Precision @1 = %0.2f%%\n',results.Pat1*100)
fprintf('Retrieval Accuracy = %0.2f%%\n',results.RA*100)
fprintf('Mean Averge Precision = %0.2f%%\n',results.MAP*100)
fprintf('Area Under Curve = %0.2f%%\n',results.AUC*100)

%%% Insert you Code here to plot the ROC curve and Precision @M curves on 2 different plots%%%%
subplot(2,1,1);
hold on; plot([results.FPR 1], [results.TPR results.TPR(end)]); title('ROC Curve'); hold off;
subplot(2,1,2);
plot(results.PAn); hold on;plot(results.PAn1);  plot(results.PAn2); plot(results.PAn3); plot(results.PAn4); title('Precision @M Curve'); hold off;
%subplot(2,1,2); plot(results.PAn1, 'b'); hold on; plot(results.PAn2,'g'); plot(results.PAn3, 'r'); plot(results.PAn4, 'c');
%plot(results.PAn5, 'm'); plot(results.PAn6, 'y'); plot(results.PAn7,'b'); plot(results.PAn8); plot(results.PAn9); plot(results.PAn10);plot(results.PAn); title('Precision @M Curve'); hold off;
%legend('zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine','Overall')
legend('Overall','Chaotic','Fault','Horizon','Salt Dome');

