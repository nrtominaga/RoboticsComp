clear
clc
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and HW6.m
% 3/7/15
%%%%%%%%%%%%%%%%%%%%%
%% 6-1
vector1 = [1 2 3 4 5 6 7 8 9 10];
vector2 = [1 2 3 4 5 6 7 8 9];
vector3 = [1 2 3 4 5 6 7 8 9];
right = my_vector_sum(vector2, vector3);
wrong = my_vector_sum(vector1, vector2);
%% 6-2
[E, O] = even_odds(randi(100,1,50));
%% 6-3
how_many_terms = sum_series(5000);