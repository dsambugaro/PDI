pkg load image

img_shaded = imread("tungsten_filament_shaded.tif");
shade_for_correction = imread("tungsten_sensor_shading.tif");

figure(1), imshow(img_shaded);
figure(2), imshow(shade_for_correction);

img_shaded = im2double(img_shaded);
shade_for_correction = im2double(shade_for_correction);

img_corrected = img_shaded ./ shade_for_correction;

figure(3), imshow(img_corrected);

imwrite(img_corrected, 'img_corrected.jpg', 'quality', 95);