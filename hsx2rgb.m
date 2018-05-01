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

% Initialize chroma, hue and m(hsl equations by default)
c = (1-abs(2*x-1)).*s;
ht = h/(1/3*pi);
I = c.*(1-abs(mod(ht,2)-1));
m = x-c/2;

if 0<=ht<=1, r=c; g=x; b=0; end;
if 1<=ht<=2, r=c; g=x; b=0; end;
if 2<=ht<=3, r=c; g=x; b=0; end;
if 3<=ht<=4, r=c; g=x; b=0; end;
if 4<=ht<=5, r=c; g=x; b=0; end;
if 5<=ht<=6, r=c; g=x; b=0; end;

% Return
rgb(:,:,1) = r;
rgb(:,:,2) = g;
rgb(:,:,3) = b;

