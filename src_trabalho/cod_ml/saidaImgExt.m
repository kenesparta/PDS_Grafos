imdata = imread('ex.png');
im_norm = double(imdata)/255; % Normalizando a imagem
im_norm = im_norm(:,:,1); % As tr�s camadas da imagem s�o iguais
imshow(im_norm,'InitialMagnification','fit')