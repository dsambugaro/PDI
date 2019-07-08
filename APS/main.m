pkg load image

im_original = imread("Imagem.jpg"); % Carrega a imagem
im_original = rgb2hsv(im_original); % Converte a imagem de RGB para HSV
value_layer = im2double(im_original(:, :, 3)); % Copia a camada de intensidade (Camada V no modelo HSV)
imsize = size(value_layer); % Armazena o tamanho da camada de intensidade

% Transforma a camada de intensidade para o dominio da frequencia
transformada =  fft2(value_layer, imsize(1)*2, imsize(2)*2);
transformada = fftshift(transformada);

figure(1),imshow(uint8(abs(transformada))); % Exibe a transformada - Apenas valores inteiros
imwrite(uint8(abs(transformada)), 'espectro.png', "quality", 100); % Salva a visualizaçao da transformada (espectro)

% Carrega o filtro e o transforma para double (O filtro foi criado no GIMP)
filtro = imread("filtro.png");
filtro = im2double(filtro);

figure(2), imshow(filtro); % Exibe o filtro
transformada = transformada.* filtro; % Aplica o filtro na camada de intensidade

% Transforma a camada de intensidade para o dominio espacial
transformada = ifftshift(transformada);
imwithfiltro = ifft2(transformada);
imwithfiltro = imwithfiltro.^0.6; % Melhora o contraste da imagem 
imwithfiltro = real(imwithfiltro);
resultado = imwithfiltro([1:imsize(1)], [1:imsize(2)]); % Seleciona apenas a imagem, ignorando a borda de 0

% Transforma a camada de intensidade para uint8
resultado = im2uint8(resultado);
figure(3),imshow(resultado); % Exibe o resultado da remoçao de ruido na camada de intensidade
imwrite(resultado, 'camada_intensidade_resultado.png', "quality", 100); % Salva a camada de intensidade sem ruido

figure(4), imshow((filtro.*uint8(abs(transformada)))); % Mostra uma representaçao do filtro sobre o "espectro"

im_original = im2uint8(im_original); % Transforma a imagem original para uint8
im_original(:, :, 3) = resultado; % Coloca a camada de intensidade sem ruido na imagem original
im_original = hsv2rgb(im_original); % Transforma de HSV para RGB
figure(5), imshow(im_original); % Exibe o resultado final

imwrite(im_original, 'resultado.png', "quality", 100); % Salva o resultado final