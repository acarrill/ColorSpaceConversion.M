close all;
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

[X_h, X_s, X_i] = rgb2hsi(X);
figure, subplot(1,3,1), imshow(X_h)
subplot(1,3,2), imshow(X_s) %Nos interesan la H y la S
subplot(1,3,3), imshow(X_i)