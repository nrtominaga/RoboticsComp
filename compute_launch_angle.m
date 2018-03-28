function angle = compute_launch_angle(target, vi)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and compute_launch_angle.m
% 3/7/15
% compute_launch_angle - computes the launch angle needed to hit a specific
% horizontal distance with a given initial velocity
% inputs - vi (initial velocity)
% outputs - angle (the angle that gets you closest to the target)
%%%%%%%%%%%%%%%%%%%%%
% Call compute range to compute the max distance and the theta associated
% with it
[big, theta] = compute_range(vi);
if (target > big)
    error('Error.  Target exceeds the max');
else
    % initialize a distance and angle variable with the max and theta
    % calculated earlier
    distance = big;
    angle = theta;
    % use while loop to increment angle and compute the distance that
    % computes the angle that gets closest to the target
    while(distance >= target)
        angle = angle + .1;
        distance = compute_landing_distance(vi, angle);
    end
end
end