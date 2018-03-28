function thetaS = compute_servo_angle(thetaL, thetaLO, thetaSO)
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga
% u0876779
% ME EN 1010 Lab Section #5
% HW#6 and compute_servo_angle.m
% 3/7/15
% compute_servo_angle - computes a servo angle
% inputs - thetaL (launch angle)
%        - thetaLO (launch angle offset)
%        - thetaSO (servo angle offset)
% outputs - thetaS (servo angle)
%%%%%%%%%%%%%%%%%%%%%
% initialize Hs
H1 = 13.2/100;
H2 = 9.5/100;
H3 = 8.8/100;
H4 = 4.7/100;
% compute Ks
K1 = H1/H2;
K2 = H1/H4;
K3 = (H1^2 + H2^2 - H3^2 + H4^2)/(2*H2*H4);
% compute theta2
theta2 = thetaL - thetaLO;
% compute A,B,C
A = cosd(theta2) - K1 - K2 * cosd(theta2) + K3;
B = -2 * sind(theta2);
C = K1 - (K2 + 1)*cosd(theta2) + K3;
% compute theta4
theta4 = 2 * atand(quadratic(A,B,C,-1));
% compute servo angle
thetaS = theta4 + thetaSO;
end