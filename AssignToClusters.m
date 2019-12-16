function [clusters] = AssignToClusters(A,means)
%This function assigns each pixel in the image array A to one of k
%clusters, based on which mean pixel each pixel is closest to. This is
%determined using the SquaredDistance function by calculating the squared
%distance between a pixel and each of the mean pixels.
%Inputs: A = A 3D array with m rows, n columns and 3 layers, containing an
%            RGB image.
%        means = A 3D array containing k rows, 1 column and 3 layers
%                containing the RGB values for each of the k means.
%Outputs: clusters = A 2D array with m rows and n columns that contains the
%                    corresponding cluster number of each pixel in the
%                    image.
%Author: Isaac Rebello

%Preallocate the array Distances
Distances = zeros(size(means,1),1);
%Find the dimensions of the array A
[m,n,~] = size(A);
%Convert array A to double precision.
A = double(A);
%Preallocate the array clusters
clusters = zeros(m,n);

%Scan array A.
for i = 1:m
    for j = 1:n
        for l = 1:size(means,1)
            %Calculate the squared distance between the current pixel and
            %each of the mean pixels, and store the results in the array
            %Distances
            squaredDistance = SquaredDistance(A(i,j,:),means(l,:,:));
            Distances(l,:) = squaredDistance;
        end
        %Determine which row the lowest value, in the array Distance, is
        %in.
        [~,I] = min(Distances);
        %Set the cluster value of that particular pixel to that of the mean
        %pixel it is closest to.
        clusters(i,j) = I;
    end
end

end