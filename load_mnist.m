function [images, NumOfClasses] = load_mnist()
% Function loads and returns images in LANDMASS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs:
%
% Outputs:
% images: A 1 x N cell structure of images extracted from LANDMASS. Equal number 
% of images are extracted from each class. N = No of samples per class *
% number of classes
% NumOfClasses: Number of Classes in MNIST i.e 10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
S = 5;  % No. of sample images per class
classes = 10;  % No. of classes
classnames = {'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'}; % classnames

images = cell(1, classes*S);  % Cell structure holding all the images
image_path = 'C:/Users/Angad/Documents/ECE 4271/Project1/Data/MNIST_students';  % location of the folder containing the images

counter = 1;
for i=1:classes
    class = classnames{i};  % Extract class name
    class_path = fullfile(image_path, class);
    for j=1:S
        number_code = append('_0',num2str(j-1));
        image_name = append(class,number_code,'.mat');
        images{1, counter} = load(fullfile(class_path,image_name));
        counter = counter + 1;
    end
end
NumOfClasses = 10;
end

