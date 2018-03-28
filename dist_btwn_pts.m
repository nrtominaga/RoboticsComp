%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and dist_btwn_pts.m
% 3/27/15
% dist_btwn_pts finds the distance between two points
% inputs - v1 (an x and y coordinate)
%        - v2 (an x and y coordinate)
% outputs - distance (the distance between two points)
%%%%%%%%%%%%%%%%%%%%%
function distance = dist_btwn_pts(v1, v2)
% use pythagorean's theorem
distance = sqrt((v2(2) - v1(2))^2 + (v2(1) - v1(1))^2);
end