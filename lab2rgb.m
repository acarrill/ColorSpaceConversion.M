function [rgb,r,g,b] = lab2rgb(lab)

% initialize variables
im2double(lab)
l = lab(:,:,1);
a = lab(:,:,2);
b = lab(:,:,3);

% Define reference tristimulus values. CIE RGB E
x0 = 0.4887180 + 0.3106803 + 0.2006017;
y0 = 0.1762044 + 0.8129847 + 0.0108109;
z0 = 0.0000000 + 0.0102048 + 0.9897952;

