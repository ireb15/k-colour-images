function [squaredDistance] = SquaredDistance(P,Q)
%This function takes two arrays which represent two separate points in 3D
%space and calculates the square of the distance between them.
%Inputs: P = An array containing three elements representing a point in 3D
%            space
%        Q = An array containing three elements representing a second point
%            in 3D space
%Outputs: squaredDistance = The square of the distance between the two
%                           points in 3D space
%Author: Isaac Rebello

squaredDistance = ((P(1)-Q(1))^2) + ((P(2)-Q(2))^2) + ((P(3)-Q(3))^2);

end