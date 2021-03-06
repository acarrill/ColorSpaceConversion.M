function [xyz,x,y,z] = rgb2xyz(rgb, RF)
% Syntax
% RF : reference matrix 

% Initialize variables.
rgb = im2double(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

% Calculate component x.
x = RF(1,1)*r + RF(1,2)*g + RF(1,3)*b;

% Calculate component y.
y = RF(2,1)*r + RF(2,2)*g + RF(2,3)*b;

% Calculate component z.
z = RF(3,1)*r + RF(3,2)*g + RF(3,3)*b;

% Return.
xyz(:,:,1) = x;
xyz(:,:,2) = y;
xyz(:,:,3) = z;

