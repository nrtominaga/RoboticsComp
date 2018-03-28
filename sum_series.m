function terms = sum_series(target)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and sum_series.m
% 3/7/15
% sum_series - computes the number of times in the series 2^k will exceed
% the target value
% inputs - target (the target you wish to reach)
% outputs - terms (the number of terms it took you to exceed the target)
%%%%%%%%%%%%%%%%%%%%%
% number of terms
terms = 0;
% running total of the sum
sum = 0;
while(sum < target)
    sum = sum + 2 ^ terms;
    terms = terms + 1; %increment terms
end

end