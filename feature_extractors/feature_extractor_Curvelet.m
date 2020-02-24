function features = feature_extractor_Curvelet(img)
% This function extracts the DFT feature for similarity-based retrieval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% img: a 2-D array

% Output
% features: a 1-D array of flattened curvelet feaures. In case you apply
% SVD truncation, output will be the singular values of curvelet
% coefficients at all scales and orientations concatenated together in a
% 1-D array instead.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extarct the cell array of Curvelet coefficients
C = fdct_wrapping(img);

% Get all the coefficients into a single array
features = [];
for i=1:length(C)
    for j=1:length(C{i})
        % Uncomment the following two lines and comment the next if you want to perform SVD
        % truncation on the curvelet features
        %singular_values = svd_trunc(C{i}{j}, 0.5);  % Retains half of the largest singular values
        %features = [features; singular_values];
        
        features = [features; C{i}{j}(:)];  % Comment this if you want to use SVD truncation. Uncomment Otherwise
    end
end

features = abs(features);
end


