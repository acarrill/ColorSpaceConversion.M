function [xyz,x,y,z] = rgb2xyz(rgb, RF)
% Syntax
% RF : reference matrix 

% Initialize variables.
rgb = im2double(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

% CIE RGB like reference White Point
% Calculate component x.
x = 0.4887180*r + 0.3106803*g + 0.2006017*b;

% Calculate component y.
y = 0.1762044*r + 0.8129847*g + 0.0108109*b;

% Calculate component z.
z = 0.0000000*r + 0.0102048*g + 0.9897952*b;

% Return.
xyz(:,:,1) = x;
xyz(:,:,2) = y;
xyz(:,:,3) = z;

