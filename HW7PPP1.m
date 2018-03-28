clear
clc
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and HW7PPP1.m
% 3/27/15
%%%%%%%%%%%%%%%%%%%%%
% read in the image
image3 = imread('test_image3.bmp');
% pick the color
[Red, Green, Blue] = color_picker(image3);
% find the centroids
[rows, columns, new_image] = find_all_target_centroids(image3, [Red, Green, Blue]);
% display the new image and plot the centroids
image(new_image);
hold on
plot(columns(1), rows(1),'wx');
hold on
plot(columns(2), rows(2),'wx');
hold on
plot(columns(3), rows(3),'wx');
hold on
plot(columns(4), rows(4),'wx');
hold on
plot(columns(5), rows(5),'wx');
hold on
plot(columns(6), rows(6),'wx');