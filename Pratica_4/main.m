pkg load image
img_original = imread("pratica4.jpg");

img_original = im2double(img_original);

filtro_media = ones(9,9);
filtro_media = filtro_media .* 1/81;

filtro_sobel = [-1, -2, -1; 0,0,0; 1,2,1]

img_filter = filter2(filtro_media, img_original);

% A imagem ficou suavizada (efeito de blur, embaçada)
% As bordas da imagem ficaram pretas, devido ao octave preencher
% automaticamente as bordas com 0
figure(1), imshow(img_filter);
imwrite(img_filter, "img_filtro_media_bordas_zero.jpg", "quality", 100);


% Bordas duplicadas
img_padding_duplicado = padarray(img_original, [4,4], 'replicate');
img_padding_duplicado_filter = filter2(filtro_media, img_padding_duplicado, 'valid');
figure(2), imshow(img_padding_duplicado_filter);
imwrite(img_padding_duplicado_filter, "img_filtro_media_bordas_replicadas.jpg", "quality", 100);

% Sobel
img_padding_duplicado = padarray(img_original, [1,1], 'replicate');
sobel_horizontal = filter2(filtro_sobel, img_padding_duplicado, 'valid');
sobel_vertical = filter2(filtro_sobel', img_padding_duplicado, 'valid');

img_sobel = abs(sobel_horizontal) + abs(sobel_vertical);

figure(3), imshow(img_sobel);
imwrite(img_sobel, "img_filtro_sobel_horizontal_e_vertical.jpg", "quality", 100);