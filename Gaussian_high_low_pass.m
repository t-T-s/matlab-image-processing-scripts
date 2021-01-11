clc
close all
clear all


RGB=imread('img1.jpeg');
I=rgb2gray(RGB);

A = fft2(double(I));
A1=fftshift(A);

[M ,N]=size(A);
R=0.0001; % filter size parameter

X=0:N-1;
Y=0:M-1;

[X, Y]=meshgrid(X,Y);

Cx=0.5*N;
Cy=0.5*M;

Low=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
High=1-Low; % High pass filter=1-low pass filter


% Applying Low Pass Filter
J=A1.*Low;
J1=ifftshift(J);
B1=ifft2(J1);

figure
imshow(B1);

% Applying High Pass Filter
K=A1.*High;
K1=ifftshift(K);
B2=ifft2(K1);

figure
imshow(B2);
