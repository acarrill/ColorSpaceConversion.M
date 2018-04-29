function [h,s,i] = rgb2hsi(rgb)
% Color space tranformation from RGB to HSI
% Sintaxis: [h,s,X] = rgb2hsi(rgb)
% qhere
% h: hue component
% s: saturation component
% X: luminiscency component (intensity||value||lightness)

% Asignamos variables.
rgb = im2double(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

% Calculamos la componente h.
theta = acos(((1/2).*((r-g)+(r-b)))./(sqrt((r-g).^2+(r-b).*(g-b))+eps));
h = theta;
h(b>g) = 2*pi - theta(b>g);
h = h/(2*pi);

% Calculamos la componente s.
s = 1 - 3.*min(min(r,g),b)./(r+g+b+eps);

% Calculamos la componente i.
i = (r+g+b)/3;

