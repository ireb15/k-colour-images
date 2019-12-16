function [seedMeans] = GetRGBValuesForPoints(A,points)
%This function takes a 3D image array from which to fetch RGB values and
%identifies the RGB values of k points, specified by a 2D array of k rows
%and 2 columns which represents the positions of the k desired points.
%Inputs: A = A 3D image array from which to fetch RGB values
%        points = A 2D array of k rows and 2 columns identifying which
%                 points (pixels) to extract RGB values for
%Ouptuts: seedMeans = A 3D array, containing k rows, 1 column and 3 layers,
%                     representing a list of k points from the image (each
%                     row corresponds to the colour information for a
%                     particular pixel from the image)
%Author: Isaac Rebello

%Split points array into an array holding the row value of each k point and
%another array holding the column value of each k value.
pointsRows = points(:,1);
pointsColumns = points(:,2);

%Find the dimensions of the points array.
D = size(points);
%Preallocate the seedMeans array.
seedMeans = zeros(D(1),1,3);

%Fetch the RGB values of the k desired points and put them into the
%seedMeans array.
for i = 1:length(pointsRows)
    for l = 1:3
        seedMeans(i,:,l) = A(pointsRows(i),pointsColumns(i),l);
    end
end
    
end