function [means] = UpdateMeans(A,k,clusters)
%This function calculates the mean RGB values for each cluster.
%Inputs: A = A 3D array with m rows, n columns and 3 layers, containing an
%            image.
%        k = A single value specifying how many clusters there are.
%        clusters = A 2D array with m rows and n columns specifying which
%                   cluster each pixel belongs to.
%Output: means = A 3D array containing k rows, 1 column, and 3 layers, with
%                the RGB values in each row corresponding to the mean RGB
%                values for each cluster.
%Author: Isaac Rebello

%Preallocate the means array.
means = zeros(k,1,3);
%Find the dimensions of the array A
[~,~,l] = size(A);

%Change the array clusters into a single column vector.
clusters = clusters(:);

%Cycle through the layers of array A
for i = 1:l
    %Change layer i of array A into a column vector.
    iCol = A(:,:,i);
    iCol = iCol(:);
    %Calculate the mean values of iCol for the k clusters, and store them 
    %in layer i of the array means. Each row in means corresponds to a 
    %cluster.
    %The use of the accumarray function in this way was found through the
    %following link on the Matlab forum:
    %https://au.mathworks.com/matlabcentral/answers/354037-averaging-specific-elements-from-array
    means(:,:,i) = accumarray(clusters,iCol,[],@mean);
end

end