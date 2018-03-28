function sum = my_vector_sum(v1 , v2)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and my_vector_sum.m
% 3/7/15
% my_vector_sum - inputs two vectors and checks if the vectors have the same
% length.  If the vectors do have the same length then it computes the sum
% of each of the elements
% inputs - v1 - a vector
%        - v2 - a vector
% outputs - sum - a vector with the sum of each of the elements of the two
% vectors
%%%%%%%%%%%%%%%%%%%%%
% check their lengths
if length(v1) ~= length(v2)
    error('Vectors need to be the same length');
else % the sum of each of the elements using a for loop
    for k = 1:length(v1)
        sum(k) = v1(k) + v2(k);
    end
end

end