function histoeq(imageName)
%% 
%Author : M.G.T.T. Senevirathna reg# EG/2015/2766
%Enter the image name as the only variable. Image should be in the same 
%folder. getSum.m contains a  custom function. Output image will be named
%"result.jpg"
addpath('./util');
% reading the image
i_image = imread(imageName);
if size(i_image,3) == 3
    o_image = rgb2gray(i_image);
else
    o_image = i_image;
end
[height,width]=size(o_image);

% Defining arrays
ImgVec = transpose(o_image(:));
ImgVec(ImgVec==0)=1;
I_freq = zeros(1,256);
I_freq_cumm = zeros(1,256);
F_eq = zeros(1,256);
F_eq_cumm = zeros(1,256);
output = zeros(1,256);

%calculating frequency of each grey level
for element = ImgVec
    I_freq(element) = I_freq(element)+1;
end

%calculating cummulative frequency of each grey level
for i = 1:256
    I_freq_cumm(i) = getSum(I_freq(1:i));
end

%calculating frequency of equalized histogram
r_mid = mod(length(ImgVec),256)/2;
eq_base = floor(length(ImgVec)/256);
for j = 1:256
    if (128>j && j>=128-r_mid)||(128<=j && j<128+r_mid) 
        F_eq(j) = eq_base+1;
    else
        F_eq(j) = eq_base;
    end
end

%calculating the cummulative frequency of equalized histogram
for k = 1:256
    F_eq_cumm(k) = getSum(F_eq(1:k));
end

%Finding closest grey level for each cummulative frequency.
for n = 1:256 
   [~, ix]=min(abs(F_eq_cumm-I_freq_cumm(n)));
   output(n)=ix-1;
end

%mapping back the values to original image vector
for m = 1:(height*width)
    ImgVec(m) = output(ImgVec(m));
end

%building the result image
r_image = reshape(ImgVec,height, width);


imshow(o_image);
figure;
imshow(r_image);

imwrite(r_image, 'result.jpg')

end

