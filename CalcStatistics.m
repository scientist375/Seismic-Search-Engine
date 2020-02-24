function stats = CalcStatisticsStudents(SimilarityMatrix,NumberOfClasss)
% Retrieval Statistics Calculations for image retrival  
% This function calculates different statistics for a given similarity metric 
% It will calculate the following: 
% 1- PAn: Pricision at n, where k = 1,2,... K-1; 
% 2- MAR: Mean reciprocal rank
% 3- MAP: Mean average precision
% 4- AUC: area under the ROC curve
% 5- FPR: False positive rate 
% 6- TPR: True positive rate.
% 7- Retrieval Accuracy
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT: 
%1-SimilarityMatrix: a square similarity matrix with all metric values 
%                    between 0 and  1 for the dataset. It can be a full,
%                    upper triangle,lower triangle matrix. 
%2-NumberOfClasss: number of classes  
%
%OUTPUT:
%1- stats: A structure elements that contains the results as: 
    %stats.PAn: A vector of length (K-1), that has P@n n=1,2,...K-1
    %stats.MRR: Mean Reciprocal Rank 
    %stats.TPR: True positive rate 
    %stats.FPR: False positive rate 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOTE: The matrix MX must have the similiarity index for every pair of images in the
% dataset ordered according to their classes, i.e. the first K rows of MX
% must be the results of comparing all images of class 1 with all images in
% the database. Every row of the matrix have all similarity metric values
% for that image with respect to all other images in the database. 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Validating inputs 
S = size(SimilarityMatrix,1)/NumberOfClasss; %number of samples per class 

if S-round(S) ~= 0 
    error('Number of classes is inconsistent with matrix dimensions'); 
end 

if nargin>3 
    error('CalcStatistics function takes two or three inputs only'); 
end 

SimilarityMatrix = SimilarityMatrix.*(1-eye(size(SimilarityMatrix)));  % removing the self-similarity value. 

if istriu(SimilarityMatrix)
    SimilarityMatrix = SimilarityMatrix + triu(SimilarityMatrix,1)'; 
elseif istril(SimilarityMatrix)
    SimilarityMatrix = SimilarityMatrix + tril(SimilarityMatrix,-1)'; 
end 

if size(SimilarityMatrix,1)~=size(SimilarityMatrix,2) 
    error('First input must be sqaure matrix');
end

%% MRR,MAP,PA results  
rank_A = zeros(NumberOfClasss*S,S-1);  %Ranks of correct images for each query image 
PA = zeros(NumberOfClasss*S,S-1); 
ok_ind = zeros(S*NumberOfClasss,S-1);
[~,sort_ind] = sort(SimilarityMatrix,2,'descend'); 

for i=1:NumberOfClasss*S
    temp = (1:S)+floor((i-1)/S)*S; %relevant images indecies 
    temp(mod(i-1,S)+1) = []; % excluding the image itself in the retreival 
    ok_ind(i,:)= temp; 
    [~,rank_A(i,:)] = ismember(ok_ind(i,:),sort_ind(i,:)); 
    PA(i,:) = ismember(sort_ind(i,1:S-1),ok_ind(i,:));
end 
rank_A = sort(rank_A,2); 
RR = 1./rank_A(:,1); 
AP = mean(repmat([1:S-1],S*NumberOfClasss,1)./rank_A,2);
PAn = mean(cumsum(PA,2))./[1:S-1]; 
stats.PAn = PAn;
stats.MRR = mean(RR);

PAn1 = mean(cumsum(PA(1:10,:),2))./[1:S-1];
PAn2 = mean(cumsum(PA(11:20,:),2))./[1:S-1];
PAn3 = mean(cumsum(PA(21:30,:),2))./[1:S-1];
PAn4 = mean(cumsum(PA(31:40,:),2))./[1:S-1];
% PAn1 = mean(cumsum(PA(1:5,:),2))./[1:S-1];
% PAn2 = mean(cumsum(PA(6:10,:),2))./[1:S-1];
% PAn3 = mean(cumsum(PA(11:15,:),2))./[1:S-1];
% PAn4 = mean(cumsum(PA(16:20,:),2))./[1:S-1];
% PAn5 = mean(cumsum(PA(21:25,:),2))./[1:S-1];
% PAn6 = mean(cumsum(PA(26:30,:),2))./[1:S-1];
% PAn7 = mean(cumsum(PA(31:35,:),2))./[1:S-1];
% PAn8 = mean(cumsum(PA(36:40,:),2))./[1:S-1];
% PAn9 = mean(cumsum(PA(41:45,:),2))./[1:S-1];
% PAn10 = mean(cumsum(PA(46:50,:),2))./[1:S-1];

stats.PAn = PAn;
stats.PAn1 = PAn1;
stats.PAn2 = PAn2;
stats.PAn3 = PAn3;
stats.PAn4 = PAn4;
% stats.PAn5 = PAn5;
% stats.PAn6 = PAn6;
% stats.PAn7 = PAn7;
% stats.PAn8 = PAn8;
% stats.PAn9 = PAn9;
% stats.PAn10 = PAn10;

% ROC calculations 
% non-relevant images 
L = zeros(S); 
T = ones(NumberOfClasss*S);
for i=1:S:NumberOfClasss*S-S+1
    T(i:i+S-1,i:i+S-1) = L; 
end

Q = SimilarityMatrix(T==1);
if ~verLessThan('matlab','R2014b')
    [NRVal,~] = histcounts(Q,'Normalization','probability','BinLimits',[0,1]); 
else
    warning('The resutls might be inacurate because of the MATLAB version')
    NRVal = hist(Q,Range);  
    NRVal = NRVal/sum(NRVal); 
end 
% Relevant image
T = 1-T-eye(NumberOfClasss*S); 
Q = SimilarityMatrix(T==1); 
[RVal,~] = histcounts(Q,length(NRVal),'Normalization','probability','BinLimits',[0,1]); 

% if you are using an old version of MATLAB, comment the line above and 
% uncomment the next two lines

% RVal = hist(Q,Range); 
% RVal=RVal/sum(RVal); 

TPR = sort((1-cumsum(RVal)));
FPR = sort((1-cumsum(NRVal)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Insert your Code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You have now the all the ingredients i.e. P@n, TPR, and FPR, to compute 
% the MAP, AUC, Precision @1, and Retrieval Accuracy. Please insert your code here like
% shown below: 
 MAP = mean(AP);
 AUC = trapz(FPR,TPR);
 Pat1 = PAn(1);
 RA = PAn(length(PAn)); 
% Uncomment these lines below after you are done
stats.MAP = MAP
stats.AUC = AUC
stats.Pat1 = Pat1
stats.RA = RA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stats.TPR = TPR; 
stats.FPR = FPR; 

end 
