%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and is_color.m
% 3/27/15
% is_color takes in  a picture array , a certain row and column , and a
% target color
% inputs - picture (image array)
%        - row (a row index)
%        - column (a column index)
%        - color (a target color)
% outputs - match (if the picture at the row and column index matches the
%           target color)
%%%%%%%%%%%%%%%%%%%%%
function match = is_color(picture, row, column, color)
if(picture(row,column,1) == color(1) && picture(row,column,2) == color(2) && picture(row,column,3) == color(3))
   match = 1; % true if the pixels match
else 
   match = 0; % false if the pixels do not match
end
end