clear
clc
%%%%%%%%%%%%%%%%%%%%%
% Naoki Tominaga & Daniel Webber
% u0876779 u0838328
% ME EN 1010 Lab Section #5
% HW#7 and HW7PPP2.m
% 3/27/15
%%%%%%%%%%%%%%%%%%%%%
picture1 = imread('joint_dots.jpg'); % read in the image
% grayscale the image
average = mean(picture1,3);
average = uint8(average);
picture2 = cat(3, average, average, average);
figure(1);
image(picture2);

errorThreshold = 30; % declare an threshold for the rror
% pick the color of the dots
[Rred,Gred,Bred] = color_picker(picture1); 
[Rgreen,Ggreen,Bgreen] = color_picker(picture1);
[Rblue,Gblue,Bblue] = color_picker(picture1);
[Ryellow,Gyellow,Byellow] = color_picker(picture1);
% find the errors
colorErrorsRed = color_error(picture1,[Rred,Gred,Bred]);
colorErrorsGreen = color_error(picture1,[Rgreen, Ggreen, Bgreen]);
colorErrorsBlue = color_error(picture1,[Rblue, Gblue, Bblue]);
colorErrorsYellow = color_error(picture1,[Ryellow, Gyellow, Byellow]);
% find where the errors are less than the threshold
[rows, columns, colors] = size(picture1);
rowred = [];
columnred = [];
rowgreen = [];
columngreen = [];
rowblue = [];
columnblue = [];
rowyellow = [];
columnyellow = [];
for i = 1:rows 
    for j = 1:columns
       if colorErrorsRed(i,j) < 30
          rowred = [rowred i];
          columnred = [columnred j];
          picture2(i,j,:) = [255 0 0];
       elseif colorErrorsGreen(i,j) < 30
          rowgreen = [rowgreen i];
          columngreen = [columngreen j];
          picture2(i,j,:) = [0 255 0];
       elseif colorErrorsBlue(i,j) < 30
          rowblue = [rowblue i];
          columnblue = [columnblue j];
          picture2(i,j,:) = [0 0 255];
       elseif colorErrorsYellow(i,j) < 30
          rowyellow = [rowyellow i];
          columnyellow = [columnyellow j];
          picture2(i,j,:) = [255 255 0];
       end
    end
end
% find the centroids of the dots
centerRedRow = mean(rowred);
centerRedCol = mean(columnred);
centerGreenRow = mean(rowgreen);
centerGreenCol = mean(columngreen);
centerBlueRow = mean(rowblue);
centerBlueCol = mean(columnblue);
centerYellowRow = mean(rowyellow);
centerYellowCol = mean(columnyellow);
% display the new image and plot the centroids of the dots
image(picture2);
hold on
plot(centerRedCol, centerRedRow, 'kx');
hold on
plot(centerGreenCol, centerGreenRow, 'kx');
hold on
plot(centerBlueCol, centerBlueRow, 'wx');
hold on
plot(centerYellowCol, centerYellowRow, 'kx');
% calculate the conversion
L3H3 = .088/dist_btwn_pts([centerGreenCol centerGreenRow], [centerRedCol centerRedRow]); 
L4H2 = .096/dist_btwn_pts([centerGreenCol centerGreenRow], [centerBlueCol centerBlueRow]);
conversion = mean([L3H3 L4H2]);
% calculate L1/H1 and L2/H4
L1H1 = dist_btwn_pts([centerBlueCol centerBlueRow], [centerYellowCol centerYellowRow])*conversion
L2H4 = dist_btwn_pts([centerYellowCol centerYellowRow], [centerRedCol centerRedRow])*conversion