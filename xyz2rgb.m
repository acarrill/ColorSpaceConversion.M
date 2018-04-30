function [rgb,r,g,b] = xyz2rgb(xyz, RF)
% Syntax
% RF : reference matrix

% Invert RF matrix
RF = inv(RF);

% initialize xyz variables
x = xyz(:,:,1);
y = xyz(:,:,2);
z = xyz(:,:,3);

% CIE RGB like reference White Point
% Calculate component x.

r = RF(1,1)*x + RF(2,1)*y + RF(3,1)*z; 
g = RF(1,2)*x + RF(2,2)*y + RF(3,2)*z;
b = RF(1,3)*x + RF(2,3)*y + RF(3,3)*z;

% Return
rgb(:,:,1) = r; 
rgb(:,:,2) = g;
rgb(:,:,3) = b;
