function features = feature_extractor_DFT(img)
% This function extracts the DFT feature for similarity-based retrieval
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% img: a 2-D array

% Output
% features: a 2-D array of DFT amplitudes same saize as img. In case you 
% decide to apply SVD truncation, output will be 1-D array of singular
% values instead.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Insert Your Code to implement DFT Feature extraction here

%running nested loops to break up images into smaller images for carrying
%out a 16 point DFT
% features = abs(fft2(img));

n = 16;
[rows,cols] = size(img);
i = 1;j = 1;

fArray = zeros(rows,cols);

for rowmove = i:n:rows
    for colmove = j:n:cols 
        if (j + n > cols)
            prevblock = min (i + n, rows);
            nextblock = min (j + n, cols);
        else 
            prevblock = i + n;
            nextblock = j + n;
        end 
        
        fArray (i: prevblock, j: nextblock) = fft2 (img(i:prevblock, j: nextblock));
    end 
end 


 features = abs(fArray);
% Uncomment this line if you want to perform SVD truncation on the DFT features
%features = svd_trunc(features, 0.5);  % retains half of the highest singular values 
end 

