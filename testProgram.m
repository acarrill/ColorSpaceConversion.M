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

[hsx, X_h, X_s, X_i] = rgb2hsi(X, 'i');
figure, imshow(hsx);
figure, subplot(1,3,1), imshow(X_h), title('hue');
subplot(1,3,2), imshow(X_s), title('saturation'); %Nos interesan la H y la S
subplot(1,3,3), imshow(X_i), title('lightness');
%% lab2xyz tests
X = imread('Board_Recorte.tif');

[lab, l, a, b] = rgb2lab(X);
figure, imshow(lab), title('after lab trans');

[xyz, x, y, z] = lab2xyz(X);
figure, imshow(xyz), title('after lab to xyz');

figure, subplot(1,3,1), imshow(x), title('x');
subplot(1,3,2), imshow(y), title('y'); %Nos interesan la H y la S
subplot(1,3,3), imshow(z), title('z');
