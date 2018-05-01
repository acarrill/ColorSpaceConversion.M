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

% Assigment in hsv case
if LIV=='v',
   c = x.*s;
   m = x-c;
end;

% Assigment in hsi case
if LIV=='i'
   z = (1-abs(mod(ht,2)-1));
   c = (3*x*s)./(1+z);
   I = c.*z;
   m = x.*(1-s);
end;

% Conditions for rgb variables assigment
for i=1:size(ht)
    for j=1:size(ht,2)
        if 0<=ht(i,j)<=1, r=c; g=I; b=0; 
        elseif 1<=ht(i,j)<=2, r=I; g=c; b=0; 
        elseif 2<=ht(i,j)<=3, r=0; g=c; b=I; 
        elseif 3<=ht(i,j)<=4, r=0; g=I; b=c; 
        elseif 4<=ht(i,j)<=5, r=I; g=0; b=c; 
        elseif 5<=ht(i,j)<=6, r=c; g=0; b=I; end;
    end;
end;

% Addition of m to each channel
r = r+m;
g = g+m;
b = b+m;

% Return
rgb(:,:,1) = r;
rgb(:,:,2) = g;
rgb(:,:,3) = b;

