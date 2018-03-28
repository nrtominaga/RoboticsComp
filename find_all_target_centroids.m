%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber 
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and find_all_target_centroids.m
% 3/27/15
% find_all_target_centroids finds the centroids of a certain color in a
% image array
% inputs - picture (image array)
%        - targets (target color)
% outputs - rows (the row indeces of the centroid)
%         - columns (the column indeces of the centroid)
%         - modImages (modified image in which the targets are eliminated)
%%%%%%%%%%%%%%%%%%%%%
function [rows, columns, modImage] = find_all_target_centroids(picture, targets)
% find the centroids and the modified image
[rows(1), columns(1), modImage] = find_target_centroid(picture, targets); 
[rows(2), columns(2), modImage] = find_target_centroid(modImage, targets);
[rows(3), columns(3), modImage] = find_target_centroid(modImage, targets);
[rows(4), columns(4), modImage] = find_target_centroid(modImage, targets);
[rows(5), columns(5), modImage] = find_target_centroid(modImage, targets);
[rows(6), columns(6), modImage] = find_target_centroid(modImage, targets);
end