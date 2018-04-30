function [rgb,r,g,b] = hsx2rgb(hsx, LIV)
% Syntax:
% LIV: select the space color by passing 'i', 'v' or 'l' like parameter
%   (the function takes 'i' by default)

% Assigment hsx variables
h = hsx(:,:,1);
s = hsx(:,:,2);
x = hsx(:,:,3);

% Initialize rgb variables
r = zeros(size(h));
g = zeros(size(h));
b = zeros(size(h));


