clear; 

rgbImage = imread('original2.jpeg');
[r,g,b] = imsplit(rgbImage);

R = histoeq_gray(r);
G = histoeq_gray(g);
B = histoeq_gray(b);
matfuncIm = histeq(rgbImage);
rgbImage(:,:,1) = R;
rgbImage(:,:,2) = G;
rgbImage(:,:,3) = B;

imshow(rgbImage);
figure,imshow(matfuncIm);

