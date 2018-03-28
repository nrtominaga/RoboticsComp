function x = quadratic(a, b, c, posneg)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and quadratic.m
% 3/7/15
% quadratic - computes the quadratic formula for a given a, b, and c as
% well as a variable that tells us to use a positive or negative for the
% square root
% inputs - a, b, c (things needed to compute the quadratic formula
%        - posneg (tells to use the negative or positive form of the
%        quadratic formula
% outputs - x (the final value)
%%%%%
% this is bad
if ((b^2 - 4*a*c) < 0)
    error('Error!');
else
   if(posneg == -1) % if we want the negative form
       x = (-b - sqrt(b^2-4*a*c))/(2*a);
   elseif(posneg == 1) % if we want the positive form
       x = (-b + sqrt(b^2 - 4*a*c))/(2*a);
   end
end
end