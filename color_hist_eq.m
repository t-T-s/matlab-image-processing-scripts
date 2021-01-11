inputImage = imread('original2.jpeg');

image1 = inputImage;
image2 = inputImage;

imshow(inputImage);
title('Input Image');

 Red = image1(:,:,1);
 Green = image1(:,:,2);
 Blue = image1(:,:,3);

Red_new = equalizeHistogram(Red);
Green_new = equalizeHistogram(Green);
Blue_new = equalizeHistogram(Blue);

image1(:,:,1) = Red_new;
image1(:,:,2)= Green_new;
image1(:,:,3) = Blue_new ;

figure,imshow(image1);
title('Image after histogram Equalization using the written Function');


Red = image2(:,:,1);
Green = image2(:,:,2);
Blue = image2(:,:,3);


Red_new = histeq(Red);
Green_new = histeq(Green);
Blue_new = histeq(Blue);

image2(:,:,1) = Red_new;
image2(:,:,2)= Green_new;
image2(:,:,3) = Blue_new ;

figure,imshow(image2);
title('Image after histogram Equalization using in built MATLAB function');

%Function for equalizing histograms
function outputImage = equalizeHistogram(inputImage)
    %Getting the no .of pixels
    numOfPixels = size(inputImage,1)*size(inputImage,2);

    %Original Intensity Frequency Array
    originalInt = zeros(256,1);

    %Adjusted Frequency 
    adjustedIn = zeros(256,1);

    %Output array
    output = zeros(256,1);

    %Intiliazing the output Image
    outputImage=uint8(zeros(size(inputImage,1),size(inputImage,2)));


    %COunting the occurence of each pixel value
    for i= 1: size(inputImage,1)
        for j=1 : size(inputImage,2)
            intensity = inputImage(i,j);
            originalInt(intensity+1) = originalInt(intensity+1) +1;            
        end
    end

    %Cumulative Array for original array
    originalCum = cumulative_array(originalInt);

    modulus = mod(numOfPixels,256) ;

    %Equalizing the histogram among intensity levels
    for i=1 : 256
        adjustedIn(i) =round(numOfPixels/256);
    end

    %Allocating the any remainder middle intensity values
    if ( modulus ~= 0)
        starting_point = 128 - modulus/2;
        for i = starting_point : starting_point + modulus
            adjustedIn(i) = adjustedIn(i)+1;
        end
    end


    %Adjusted Cumulative Frequency Array
    adjustedCum = cumulative_array(adjustedIn);

    %Finding the relevant output  for given input intesity level by comparing 
    for i=1 : 256
        minimum_diff = abs(adjustedCum(1)-originalCum(i));
        for j = 2:256
            differance = abs(adjustedCum(j)-originalCum(i));
            if ( minimum_diff > differance)
                minimum_diff = differance;    
            else( minimum_diff < differance)
                output(i) = j-2;
                break
            end      
           if (j == 256)
               output(i)=256-1;
           end    
        end        
    end

    %Applying the equalized histogram to the output image
    for i=1:size(inputImage,1)
        for j=1:size(inputImage,2)
              outputImage(i,j)=output(inputImage(i,j)+1);
        end
    end
end


% Function to get the cumulative  array
function y = cumulative_array(x)
    y = zeros(256,1);
    sum = 0;
    for i = 1: size(x)
       sum = sum + x(i) ;
       y(i) = sum;
    end
end
