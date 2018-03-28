%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber 
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and find_target_centroid.m
% 3/27/15
% find_target_centroid takes in a image array and a target color and finds
% the centroid of that color
% inputs - picture (image array)
%        - target (target color)
% outputs - row (the row index of the centroid)
%         - column (the column index of the centroid)
%         - modImage (modified image in which the targets eliminated)
%%%%%%%%%%%%%%%%%%%%%
function [row, column, modImage] = find_target_centroid(picture, target)
% find the corner
[cornerRow, cornerCol] = find_target_corner(picture, target); 
colLength = 0; % keep track of the column and row length
rowLength = 0;
while is_color(picture, cornerRow, cornerCol + colLength, target) == 1
   colLength = colLength + 1; % while color in next column is the same color
end
while is_color(picture, cornerRow + rowLength, cornerCol, target) == 1
   rowLength = rowLength + 1; % while color in next row is same color
end
column = (colLength-1)/2 + cornerCol; % find the centroid
row = (rowLength-1)/2 + cornerRow;
modImage = picture; % modify the pictures
for i = 0:rowLength
    for j = 0:colLength
        modImage(cornerRow + i, cornerCol + j,1) = 0;
        modImage(cornerRow + i, cornerCol + j,2) = 0;
        modImage(cornerRow + i, cornerCol + j,3) = 0;
    end
end
end