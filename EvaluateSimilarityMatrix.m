function SimilarityMatrix = EvaluateSimilarityMatrix(images)
%This function computes the Similarity Matrix of a given set of Images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input 
% images: Cell structure of images of dimension 1xN, where N is the number of
% Images
%
% Output
% SimilarityMatrix: NxN similariy matrix for all images 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 M = size(images,2);
 SimilarityMatrix = zeros(M,M); 
 
 fprintf('Calculating Similarity: 0.00%%')
 Num = '0.00%%'; 
 c = 0; 
 
 for i=1:M
     for j = i:M
            SimilarityMatrix(i,j) = imageSimilarityScore(images{i}.img, images{j}.img); 
            c = c+1; 
            Str = repmat('\b',1,length(Num)-1); 
            Num = [num2str(c/(M*(M-1)/2+M)*100,'%0.2f'),'%%'];
            temp = [Str,Num];  
            fprintf(temp);
     end    
 end
 
 SimilarityMatrix = SimilarityMatrix + triu(SimilarityMatrix,1)';
 


end

