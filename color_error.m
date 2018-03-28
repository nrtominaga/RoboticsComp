%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and color_error.m
% 3/27/15
% color_error outputs an arry of errors for a image array based on a target
% color
% inputs - picture (image array)
%        - target (target color)
% outputs - error (array of errors)
%%%%%%%%%%%%%%%%%%%%%
function error = color_error(picture, target)
picture = double(picture);
target = double(target);
error = (abs(picture(:,:,1) - target(1)) + abs(picture(:,:,2) - target(2)) + abs(picture(:,:,3) - target(3)))/3;
error = uint8(error);
end