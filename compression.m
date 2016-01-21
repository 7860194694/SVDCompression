img = imread(\"lion.jpg\");
k = min(rows(img), columns(img)) / 30;
[U, S, V] = svd(img);
UL = single(U(:, 1:k));
VL = single(V(:, 1:k));
SL = single(S(1:k, 1:k));
img_c = UL * SL * VL';
filesize_reduction = 1 - (sizeof(UL) + sizeof(VL) + sizeof(SL)) / sizeof(img)
    
subplot(2, 2, 1)
imshow(img, [])
subplot(2, 2, 2)
imshow(img_c, [])