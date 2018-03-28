clear
clc
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and HW7PPP1.m
% 3/27/15
%%%%%%%%%%%%%%%%%%%%%
% read in the image
image3 = imread('PP_A2.bmp');
% pick the color
[Red, Green, Blue] = color_picker(image3);
% find the centroids
[rows, columns, new_image] = find_all_target_centroids(image3, [Red, Green, Blue]);
% display the new image and plot the centroids
image(new_image);
hold on
plot(columns(1), rows(1),'wx');
hold on
plot(columns(2), rows(2),'wx');
hold on
plot(columns(3), rows(3),'wx');
hold on
plot(columns(4), rows(4),'wx');
hold on
plot(columns(5), rows(5),'wx');
hold on
plot(columns(6), rows(6),'wx');

cmRows = rows/10; %puts rows into centemeters
col_highbyte = floor(columns/256);
col_lowbyte = columns-col_highbyte*256;

robot = serial('/dev/tty.usbmodem1411','BaudRate',9600);
fopen(robot);

for k = 1:1:6
    fwrite(robot,cmRows(k));
    fwrite(robot,col_highbyte(k));
    fwrite(robot,col_lowbyte(k));
    while (robot.BytesAvailable < 1)
        %wait
    end
    while (robot.BytesAvailable > 0)
        message = fscanf(robot);
        disp(message);
    end
end
fclose(robot);
delete(robot);