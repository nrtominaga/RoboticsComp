function [range, theta] = compute_range(vi)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and compute_range.m
% 3/7/15
% compute_range - will compute the max distance achieveable with a given
% initial velocity
% inputs - vi (initial velocity)
% outputs - range (the landing distance)
%%%%%%%%%%%%%%%%%%%%%
% Initialize range as max distance
range = compute_landing_distance(vi, 22.1);
theta = 22.1;
% Use a for loop to step through an array of launch angles (the min and max
% angles should correspond to the physical min and max afforded by the 
% fourbar linkage on your cannon assembly)
for k = linspace(22.1, 83, 20)
    distance = compute_landing_distance(vi, k);
    if (distance > range) % if its greater store that distance and corresponding angle
        range = distance;
        theta = k;
    end
end
end