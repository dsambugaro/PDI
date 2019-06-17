pkg load image

original = imread("pratica7.png");
original = im2double(original);
imsize = size(original);


transformada =  fft2(original, imsize(1)*2, imsize(2)*2);

transformada = fftshift(transformada);
espectro = transformada;

figure(1),imshow(uint8(abs(espectro)));
imwrite(uint8(abs(espectro)), 'espectro.png', "quality", 100);
filtro = ones(size(transformada));

%filtro = imread('Filtro.png');
%filtro = im2double(filtro);

P = size(transformada)(1);
Q = size(transformada)(2);

D0 = 20;

for u=1:P
  for v=1:Q
    if(v >= 725 && v <= 783)
      if(u >= 0 && u <= 790 || u >= 826 && u <= 1616)
        filtro(u, v) = 0;
      endif
    endif
    if((v >= 705 && v <= 798) && ((u >= 0 && u <= 50) || (u >= 1566 && u <= 1616)))
      filtro(u, v) = 0;
    endif
  endfor
endfor

figure(2), imshow(filtro);
imwrite(filtro, 'filtro.png', "quality", 100);

transformada = transformada.* filtro;
transformada = ifftshift(transformada);
imwithfiltro = ifft2(transformada);
imwithfiltro = real(imwithfiltro);
resultado = imwithfiltro([1:imsize(1)], [1:imsize(2)]);

resultado = im2uint8(resultado);

figure(3),imshow(resultado);

imwrite(resultado, 'resultado.png', "quality", 100);

figure(4), imshow((filtro.*uint8(abs(espectro))));