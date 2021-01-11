clear;
%% Downsampling

I_g = imread('original2.jpeg');
I = rgb2gray(I_g);
% J=downsample(I,4);
% J=downsample(transpose(J),4)';
% whos I J
% imshow(J)
% figure, imshow(I)

%% imrsize

% J = imresize(I,0.5);
% whos I J
% imshow(J);
% figure, imshow(I);


%% sub-sampling
% select only the odd pixels for both rows and columns. 
% That is why 2 is there.
% J = I(1:2:end, 1:2:end);
% imshow(J);
% whos I J

%% Interpolation and increasing the size

J=zeros(2*size(I,1),2*size(I,2));
J(1:2:end, 1:2:end) = I(:,:);
J2 = conv2(double(J), ones(2,2)/4, 'same');
% J2 = imfilter(double(J),ones(2,2)/4);
imshow(I);
figure, imshow(mat2gray(J2));
whos I J
