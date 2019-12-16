function [points] = SelectKRandomPoints(A,k)
%This function generates a 2D array containing k rows and 2 columns which
%represents k randomly selected points (pixels), based on the desired
%number of randomly selected points (pixels), k, that are accordingly
%selected from the 3D image array A.
%Inputs: A = A 3D image array from which to select points from
%        k = The number of points to randomly select
%Outputs: points = A 2D array containing k rows and 2 columns, representing
%                  k randomly selected points (pixels)
%Author: Isaac Rebello

%Preallocate points array.
points = zeros(k,2);
%Preallocate randPoint array.
randPoint = zeros(1,2);

%Cycle through the rows of the points array.
for i = 1:k
    %Generate a random number to be the row value for randPoint
    randPoint(1,1) = randi(size(A,1));
    %Generate a random number to be the column value for randPoint
    randPoint(1,2) = randi(size(A,2));
    %Check if randPoint is already a point stored in the points array (i.e. 
    %check if randPoint is already a row in the points array).
    [Result,~] = ismember(randPoint,points,'rows');
    %If randPoint is already a point stored in the points array, generate 
    %random numbers again to be the new row and column values for
    %randPoint. This will continue until randPoint is not a point that is
    %already stored in the points array.
    while Result == 1
        randPoint(1,1) = randi(size(A,1));
        randPoint(1,2) = randi(size(A,2));
        [Result,~] = ismember(randPoint,points,'rows');
    end
    %If randPoint is not a point that is already stored in the points
    %array, store randPoint in the current row, i, of the points array.
    points(i,:) = randPoint;
end

end