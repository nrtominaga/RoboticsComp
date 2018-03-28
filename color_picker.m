%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and color_picker.m
% 3/27/15
% color_picker makes a user pick a pixel and the function returns the RGB
% values at that pixel
% inputs - pic (image array)
% outputs - Red (a red value)
%         - Green (a green value)
%         - Blue (a blue value)
%%%%%%%%%%%%%%%%%%%%%
function [Red,Green,Blue] = color_picker(pic)
% choose a pixel
image(pic)
[x,y] = ginput(1);
% round the values
X = round(x);
Y = round(y);
% get the RGB values
Red = pic(Y,X,1);
Green = pic(Y,X,2);
Blue = pic(Y,X,3);
end