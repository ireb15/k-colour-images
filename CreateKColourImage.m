function [B] = CreateKColourImage(clusters,means)
%This function creates an RGB image of k colours from an image that has had
%its pixels divided into k clusters. Each pixel in the k-colour image has
%had its RGB values changed to the mean RGB values of the cluster it
%belongs to.
%Inputs: clusters = A 2D array with m rows and n columns which specifies
%                   which cluster each pixel belongs to
%        means = A 3D array containing k rows, 1 column and 3 layers, where
%                each row contains the mean RGB values for the cluster
%                corresponding to that row number
%Ouptut: B = A 3D array of unsigned 8 bit integers with m rows, n columns
%            and 3 layers, representing an RGB image. The RGB values of
%            each pixel in this image are the mean RGB values of the
%            cluster it belongs to.
%Author: Isaac Rebello

%Round any non-integer values in the means array to the neartest integer.
means = round(means);

%Find the dimensions of the clusters array.
[rows,cols] = size(clusters);
%Preallocate array B.
B = zeros(rows,cols,3,'uint8');

%Identify which cluster each pixel belongs to.
for i = 1:rows
    for j = 1:cols
        %Accordingly set the RGB values of each pixel to the mean RGB
        %values of the cluster they belong to.
        for l = 1:length(means)
            for m = 1:3
                if clusters(i,j) == l
                    B(i,j,m) = means(l,:,m);
                end
            end
        end
    end
end
    
end