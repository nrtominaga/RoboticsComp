%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u01876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and find_target_corner.m
% 3/27/15
% find_target_corner takes in a image array and a target color and outputs
% the top-left most color where that color is in the image
% inputs - picture (image array)
%        - target (target color)
% outputs - row (the top left most corner row index where that color is in 
%           the image)
%         - col (the top left most corner column index where that color is
%           in the image)
%%%%%%%%%%%%%%%%%%%%%
function [row,col] = find_target_corner(picture,target)
[rows,columns,colors] = size(picture); % find the size of the pic
for k = 1:rows % loop thru the rows
    for j = 1:columns % loop thru the columns
        if is_color(picture,k,j,target) == 1
            row = k; % if its the right color set the outputs and jump
            col = j; % out of the function
            return;
        end
    end
end
end