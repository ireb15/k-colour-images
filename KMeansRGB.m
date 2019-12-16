function [clusters,means] = KMeansRGB(A,seedMeans,maxIterations)
%This function partitions the pixels in an image into k clusters, using the
%k-means alogorithm to do so. This involves determining which mean pixel 
%each pixel in the image is closest to, and accordingly grouping that
%particular pixel with the cluster of the closest mean pixel.
%Inputs: A = A 3D array with m row, n columns, and 3 layers, containing an
%            RGB image.
%        seedMeans = A 3D array containing k rows, 1 column, and 3 layers,
%                    containing the seed mean values which will be used to
%                    initialise the k-means algorithm.
%        maxIterations = The maximum number of iterations to perform.
%Outputs: clusters = A 2D array with m rows and n columns specifying which
%                    cluster each pixel belongs to.
%         means = A 3D array containing k rows, 1 column, and 3 layers,
%                 where each row contains the mean RGB values for the
%                 cluster corresponding to that row number.
%Author: Isaac Rebello

iteration = 1;
%Set the seedMeans array as the means array for the first iteration.
means = seedMeans;
k = size(means,1);

while iteration <= maxIterations
    %Call on the AssignToClusters function to specify which cluster each 
    %pixel belongs to.
    [clusters] = AssignToClusters(A,means);
    %Call on the UpdateMeans function to calculate the mean RGB values for
    %each cluster.
    [means] = UpdateMeans(A,k,clusters);
    %Save the means array from the second to last iteration.
    if iteration == maxIterations - 1
        second2lastItmeans = means;
    %Save the means array from the last iteration.
    elseif iteration == maxIterations
        maxItmeans = means;
    end
    iteration = iteration + 1;
end

%Determine if convergence was reached within the specified number of
%iterations. Convergence occurs when the means of the k clusters stop
%changing.
if second2lastItmeans ~= maxItmeans
    warning = 'Maximum number of iterations reached before convergence was achieved.';
    fprintf(2,'%s',warning);
end

end