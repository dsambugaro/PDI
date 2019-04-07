pkg load image

im = imread("pollen.jpg");

% Os pontos abaixo foram os pontos escolhidos por nós. Os pontos foram
% escolhidos com base no histograma e tambem ao analisar nossa imagem de saida
% com a imagem esperada vimos que alguns pontos precisavam ficar mais escuros e
% outros mais claros. Para escurecer mapeanos os pontos mais baixos, onde
% passamos os pontos escuros para um valor mais proximo de 0.
% No ponto mais alto, ajustamos os valores claros para um valor mais proximo de 255.

xa = 0;
ya = 0;

xb = 90;
yb = 20;

xc = 140;
yc = 230;

xd = 255;
yd = 255;


mat = im2uint8(zeros(size(im)));

vet = zeros(1, 256);

m0 = (yb-ya) / (xb-xa); # Coeficiente angular do primeiro seguimento de reta
for i = xa:xb
  vet(i+1) = ya + m0 *(i-xa);
  vet(i+1);
endfor

m1  = (yc-yb) / (xc-xb); # Coeficiente angular do primeiro segundo de reta
for i = xb+1:xc 
  vet(i+1) = yb + m1 *(i-xb);
endfor

m2 = (yd-yc) / (xd-xc); # Coeficiente angular do primeiro terceiro de reta
for i = xc+1: xd
  vet(i+1) = yc + m2 * (i-xc);
endfor

figure(1), plot(0:255, vet) # Plot dos seguimentos de reta

for i = 1:889
  for j = 1:889
    mat(i,j) = vet(im(i,j));
  endfor
endfor

figure(2), imshow(mat)

imwrite(mat, 'img_corrected.jpg', 'quality', 95);