clear;
pointd_detection_mask = [-1 -1 -1; -1 8 -1;-1 -1 -1];
w = pointd_detection_mask;
I =imread('points.png');
I =rgb2gray(I);

abs(imfilter(double(I),w));

T = max(I(:))/2;
g = I>= T;
imshow(I);
figure, imshow(g)