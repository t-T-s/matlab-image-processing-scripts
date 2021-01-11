im = imread('Lenna.png');
n=1;
d=50;
h=size(im,1);
w=size(im,2);
fftim = fftshift(fft2(double(im)));
[x ,y]=meshgrid(-floor(w/2):floor(w/2)-1,-floor(h/2):floor(h/2)-1);

B = sqrt(2) - 1; %// Define B
D = sqrt(x.^2 + y.^2); %// Define distance to centre
hhp = 1 ./ (1 + B * ((d ./ D).^(2 * n)));
out_spec_centre = fftim .* hhp;

%// Uncentre spectrum
out_spec = ifftshift(out_spec_centre);

%// Inverse FFT, get real components, and cast
out = uint8(real(ifft2(out_spec)));

%// Show image
imshow(out);