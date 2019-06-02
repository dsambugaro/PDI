pkg load image

% 2) Conforme aumentamos a quantidade de imagem para fazer a media, melhor vai ficando o resultados da imagem de saida.
% A media com poucas imagens o ruido fica mais evidente, conforme adicionamos mais imagens o ruido fica menos evidente.


function res = mediaArtm(imagem, quantidade)
 r1 = 0;
  r = 0;
  for i = 1:quantidade
  r = uint64(imnoise(imagem, 'gaussian', 0, 0.25));
  r1 = uint64(r1+r);
  endfor
  res = uint8(r1/quantidade);
  %imshow(res)
endfunction  

original = imread('pratica5.png');
retorno8 = mediaArtm(original, 8);
imwrite(retorno8, 'imagem8.png', "quality", 100);
retorno16 = mediaArtm(original, 8);
imwrite(retorno16, 'imagem16.png', "quality", 100);
retorno64 = mediaArtm(original, 64);
imwrite(retorno64, 'imagem64.png', "quality", 100);
