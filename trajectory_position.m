
function [x, y] = trajectory_position(v0, theta, t)
d1 = 5.3/100;
d2 = 15.9/100;
d3 = 7.5/100;
g = 9.81;

x0 = d2 * cosd(theta) - d3 * sind(theta);
y0 = d1 + d2 * sind(theta) + d3 * cosd(theta);
x = x0 + v0*cosd(theta)*t;
y = y0 + v0*sind(theta)*t - (1/2)*g*(t^2);
end