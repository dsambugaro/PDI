pkg load image
img_original = imread("pratica4.jpg");

img_original = im2double(img_original);

filtro_media = [1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1,1];
filtro_media = filtro_media .* 1/81;

img = filter2(filtro_media, img_original, 'full');

imshow(img)