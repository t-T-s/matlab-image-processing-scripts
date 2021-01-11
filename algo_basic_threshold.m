clear;
im = imread('img1.jpeg');
im2 = global_threshold(im ,0.5);
imshow(im2)

function g  = global_threshold(img, delta_T)
    new_image = im2uint8(img);
    T = mean2(new_image);
    done =  false;
    
    while ~done
        G =  new_image > T;
        T_new = 0.5*(mean(new_image(G))+(mean(new_image(~G))));
        done = abs(T- T_new)< delta_T;
        T = T_new;
    end
    g = imbinarize(new_image, T /255);
end

