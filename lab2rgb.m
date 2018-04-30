function [rgb,r,g,b] = lab2rgb(lab, CIE)
% Syntax
% RF : reference matrix

% variables assigment
im2double(lab);
l = lab(:,:,1);
a = lab(:,:,2);
b = lab(:,:,3);

[xyz,x,y,z] = lab2xyz(lab, CIE);

[rgb,r,g,b] = xyz2rgb(xyz, CIE);




