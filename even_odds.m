function [even, odd] = even_odds(vector)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and even_odds.m
% 3/7/15
% even_odds - finds how many even and odd numbers there are in a given
% vector
% inputs - vector (a vector)
% outputs - even (the number of even numbers)
%         - odd (the number of odd numbers)
%%%%%%%%%%%%%%%%%%%%%
% counter variables for the number of even and odd numbers
even = 0;
odd = 0;
% go thru every element in vector and compute if its an even or odd number
for k = 1:length(vector)
    if rem(vector(k), 2) == 0
        even = even + 1; % increment even
    else
        odd = odd + 1; %increment odd
    end
end

end