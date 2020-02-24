function [images, NumOfClasses] = load_landmass()
% Function loads and returns images in LANDMASS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs:
%
% Outputs:
% images: A 1 x N cell structure of images extracted from LANDMASS. Equal number 
% of images are extracted from each class. N = No of samples per class *
% number of classes
% NumOfCLasses: Number of CLasses in LANDMASS i.e. 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = 10;  % No. of sample images per class
classes = 4;  % No. of classes
classnames = {'chaotic', 'fault', 'horizon', 'saltdome'}; % classnames

images = cell(1, classes*S);  % Cell structure holding all the images
image_path = 'C:/Users/Angad/Documents/ECE 4271/Project1/Data/LANDMASS_students';  % location of the folder containing the images.

counter = 1;
for i=1:classes
    class = classnames{i};  % Extract class name
    class_path = fullfile(image_path, class);
    for j=1:S
        if j==S
            number_code = append('_00',num2str(10));
        else
            number_code = append('_000',num2str(j));
        end
        image_name = append(class,number_code,'.mat');
        images{1, counter} = load(fullfile(class_path,image_name));
        counter = counter + 1;
    end
end

NumOfClasses = 4;
end

