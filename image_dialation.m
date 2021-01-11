g =imread('text_1.png');
f = dilate(g);
imshow(f)


function D  = dilate(img)
    img = imbinarize(img);
    %element = getnhood(strel('square',3));
    element = getnhood(strel('line',7,90));
    m = floor(size(element,1)/2);
    n = floor(size(element,2)/2);
    
    C = padarray(img,[m n]);
    D = false(size(img));
    
    for i=1 :size(C,1) - (2*m)
        for j = 1 : size(C,2) -(2*n)
            image_block = C(i : i+ (2*m), j : j +(2*n));
            D(i,j) = max(max(image_block & element));
             
        end
    end           
end


