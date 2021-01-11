clear;
%Part 1
% X is the input image and P is the cut-off freq
P = 100;
X = 'img1.jpeg';
f=imread(X);  % reading an image X
f=rgb2gray(f);
[M,N]=size(f); % Saving the the rows of X in M and columns in N
F=fft2(double(f)); % Taking Fourier transform to the input image

%Part 2 % I don't understand this part
u=0:(M-1);
v=0:(N-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);

%Part 3
H=double(D<=P);       % Comparing with the cut-off frequency
G=H.*F;               % Convolution with the Fourier transformed image
g=real(ifft2(double(G))); % Inverse Fourier transform
imshow(f),figure,imshow(g,[ ]); % Displaying input and output image
