function features = feature_extractor_DCT(img)
% This function extracts the DFT feature for similarity-based retrieval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% img: a 2-D array

% Output
% features: a 2-D array of DCT amplitudes same saize as img. In case you
% apply SVD truncation, output will be 1-D array of singular values instead
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Insert your code to implement DCT feature extraction here
n = 16;
[rows,cols] = size(img);
i = 1;j = 1;

DCTArray = zeros(rows,cols);

for rowmove = i:n:rows
    for colmove = j:n:cols 
        if (j + n > cols)
            prevblock = min (i + n, rows);
            nextblock = min (j + n, cols);
        else 
            prevblock = i + n;
            nextblock = j + n;
        end 
        
        DCTArray (i: prevblock, j: nextblock) = dct2 (img(i:prevblock, j: nextblock));
    end 
end 


 features = abs(DCTArray);

% Uncomment this line if you want to perform SVD truncation on the DFT features
%features = svd_trunc(features, 0.5);  % retains half of the highest singular values 
end 