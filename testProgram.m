close all;
clear all;
%% Leemos imagen y la pasamos a HSI
X = imread('Board_Recorte.tif');
figure, imshow(X), title('imagen original')
size_X = size(X);
X_r = X(:,:,1);
X_g = X(:,:,2);
X_b = X(:,:,3);
figure, subplot(2,2,1), imshow(X_r), title('componente roja')
subplot(2,2,2), imshow(X_g), title('componente verde')
subplot(2,2,3), imshow(X_b), title('componente azul')

[hsx, X_h, X_s, X_i] = rgb2hsx(X, 'v');
figure, imshow(hsx);
figure, subplot(1,3,1), imshow(X_h), title('hue');
subplot(1,3,2), imshow(X_s), title('saturation'); %Nos interesan la H y la S
subplot(1,3,3), imshow(X_i), title('lightness');
%% lab2xyz tests
close all
clear all
%reference white point matrix
CIE = [0.488718000000000,0.310680300000000,0.200601700000000;
       0.176204400000000,0.812984700000000,0.010810900000000;
       0.000000000000000,0.010204800000000,0.989795200000000];

X = imread('Board_Recorte.tif');

[lab, l, a, b] = rgb2lab(X,CIE);
figure, imshow(lab), title('rgb to lab');

[rgb, r, g, b] = lab2rgb(X, CIE);
figure, imshow(rgb), title('lab to rgb');

% [xyz, x, y, z] = xyz2rgb(xyzLAB, CIE);
% figure, imshow(xyz), title('xyz to rgb after lab2xyz');

[xyz, x, y, z] = rgb2xyz(X, CIE);
figure, imshow(xyz), title('rgb to xyz');

[rgb, r, g, b] = xyz2rgb(xyz, CIE);
figure, imshow(xyz), title('xyz to rgb');

[hsv] = rgb2hsl(X);
figure, imshow(hsv), title('rgb to hsv MATLAB');

[hsv, h, s, v] = rgb2hsx(X, 'l');
figure, imshow(hsv), title('my rgb to hsv');

