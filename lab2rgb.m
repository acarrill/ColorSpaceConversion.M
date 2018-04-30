function [rgb,r,g,b] = lab2rgb(lab)

% variables assigment
im2double(lab)
l = lab(:,:,1);
a = lab(:,:,2);
b = lab(:,:,3);

% xyz variables initialization
x = zeros(size(l));
y = zeros(size(l));
z = zeros(size(l));

% Define reference tristimulus values. CIE RGB E
x0 = 0.4887180 + 0.3106803 + 0.2006017;
y0 = 0.1762044 + 0.8129847 + 0.0108109;
z0 = 0.0000000 + 0.0102048 + 0.9897952;

% Consts
P = (l.+16)/116;

% Identity for assigment 
id = P^3;





