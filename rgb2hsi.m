function [hsx, h,s,x] = rgb2hsi(rgb, LIV)
% Color space tranformation from RGB to HSI
% Sintaxis: [h,s,X] = rgb2hsi(rgb)
% h: hue component
% s: saturation component
% X: luminiscency component (intensity||value||lightness)
% LIV: select the space color by passing 'i', 'v' or 'l' like parameter
%   (the function takes 'i' by default)

% variables assigment.
rgb = im2double(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

% H component calculation. (with eps we avoid division by zero)
theta = acos(((1/2).*((r-g)+(r-b)))./(sqrt((r-g).^2+(r-b).*(g-b))+eps));
h = theta;
h(b>g) = 2*pi - theta(b>g);
h = h/(2*pi);

% Calculate respective l||i||v.
x = (r+g+b)/3;
if x == 'v', x = max(max(r,g),b)./2 - min(min(r,g),b); end;
if x == 'l', x = max(max(r,g),b); end;

% S component calculation.
s = 3.*min(min(r,g),b)./(r+g+b+eps);
c = max(max(r,g),b) - min(min(r,g),b)
if x == 'v', s = c/v; end; 
if x == 'l', s = c/(1-abs(2*L-1)); end;
