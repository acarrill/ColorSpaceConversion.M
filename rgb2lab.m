function [lab,l,a,b] = rgb2lab(rgb)

% Variables assigment.
rgb = im2double(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

% Performs CIE XYZ tranformation.
[xyz,x,y,z] = rgb2xyz(rgb);

% Initialize lab variables
l = zeros(size(r));
a = zeros(size(g));
b = zeros(size(b));

% Define reference tristimulus values. CIE RGB E
x0 = 0.4887180 + 0.3106803 + 0.2006017;
y0 = 0.1762044 + 0.8129847 + 0.0108109;
z0 = 0.0000000 + 0.0102048 + 0.9897952;

% Normalize tristimulus values.
xn = x/x0;
yn = y/y0;
zn = z/z0;

% Identities declaration.
% l
id1 = (yn > 0.008856);
id2 = (yn <= 0.008856);
%a
id3 = (xn > 0.008856) & (yn > 0.008856);
id4 = (xn > 0.008856) & (yn <= 0.008856);
id5 = (xn <= 0.008856) & (yn > 0.008856);
id6 = (xn <= 0.008856) & (yn <= 0.008856);
%b
id7 = (yn > 0.008856) & (zn > 0.008856);
id8 = (yn > 0.008856) & (zn <= 0.008856);
id9 = (yn <= 0.008856) & (zn > 0.008856);
id10 = (yn <= 0.008856) & (zn <= 0.008856);

% consts.
t0a = 7.787;
t0b = 16/166;

% l component calculation.
l(id1) = 116*(yn(id1).^(1/3))-16;
l(id2) = 903.3*yn(id2);

% a component calculation.
a(id3) = 500*(xn(id3).^(1/3)-yn(id3).^(1/3));
a(id4) = 500*(xn(id4).^(1/3)-(t0a*yn(id4)+t0b));
a(id5) = 500*((t0a*xn(id5)+t0b)-yn(id5).^(1/3));
a(id6) = 500*((t0a*xn(id6)+t0b)-(t0a*yn(id6)+t0b));

% b component calculation.
b(id7) = 200*(yn(id7).^(1/3)-zn(id7).^(1/3));
b(id8) = 200*(yn(id8).^(1/3)-(t0a*zn(id8)+t0b));
b(id9) = 200*((t0a*yn(id9)+t0b)-zn(id9).^(1/3));
b(id10) = 200*((t0a*yn(id10)+t0b)-(t0a*zn(id10)+t0b));

% Return.
lab(:,:,1) = l;
lab(:,:,2) = a;
lab(:,:,3) = b;
