pkg load image;

m = imread("imagem.jpg");

[counts, x] = imhist(m);

[M, N] = size(m);

mat = im2uint8(zeros(M,N));

arr = zeros(size(counts));
resultados = zeros(size(counts));


arr = counts./(M*N);

resultados(1) = 255 * arr(1);

for i = 2:256

resultados(i) = (255*arr(i)) + resultados(i-1);

endfor

for i = 1:M
  for j = 1:N
    mat(i,j) = resultados(m(i,j)); % O arrendondamento é feite implicitamente pelo Octave
   endfor
endfor

figure(1),plot(resultados);

figure(2),imshow(mat);

imwrite(mat, "img_corrected.jpg", "quality", 100);


    


