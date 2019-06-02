pkg load image

original = imread("pratica6.png");
original = im2double(original);
imsize = size(original);


transformada =  fft2(original, imsize(1)*2, imsize(2)*2);
% A dimensao da transformada e M*2, por N*2 (O dobro da imagem original)
% Neste caso 512*512;

transformada = fftshift(transformada);
espectro = transformada;

figure(1),imshow(uint8(abs(espectro)));

filtro = zeros(size(transformada));

P = size(transformada)(1);
Q = size(transformada)(2);

D0 = 20;

for u=1:P
  for v=1:Q
  D = sqrt((u - P/2)^2 + (v - Q/2)^2);
  filtro(u,v) = e^(-(D^2)/(2*(D0^2)));
  endfor
endfor

figure(2), imshow(filtro);

transformada = transformada.* filtro;
imwithfiltro = ifftshift(transformada);
imwithfiltro = ifft2(imwithfiltro);
imwithfiltro = real(imwithfiltro);
resultado = imwithfiltro([1:imsize(1)], [1:imsize(2)]);

resultado = im2uint8(resultado);

figure(3),imshow(resultado);

imwrite(resultado, 'resultado_transformada_inversa_rapida.png', "quality", 100);