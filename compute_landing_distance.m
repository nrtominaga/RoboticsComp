function xf = compute_landing_distance(vi, theta)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and compute_landing_distance.m
% 3/7/15
% compute_landing_distance - computes the final horizontal landing distance 
% when it hits the ground at y = 0
% inputs - vi (initial velocity)
%        - theta (the launch angle)
% outputs - xf (the landing distance)
%%%%%%%%%%%%%%%%%%%%%
% compute the ds
d1 = 6.3/100;
d2 = 15.9/100;
d3 = 7.5/100;
% compute the a, b, c
a = -9.81/2;
b = vi * sind(theta);
c = d1 + d2 * sind(theta) + d3 * cosd(theta);
% perform the quadratic
tf = quadratic(a, b, c, -1);
% calculate the final x 
xf = vi * cosd(theta) * tf + (d2 * cosd(theta) - d3 * sind(theta));
end