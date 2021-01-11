I = imread('original2.jpeg');
I = imbinarize(I);

se = ones(5,7);

[P,Q] = size(se);
In = zeros(size(I,1), size(I,2));

for i=ceil(P/2):size(I, 1)-floor(P/2) 
    for j=ceil(Q/2):size(I, 2)-floor(Q/2) 
  
          on=I(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2));
          nh =on(logical(se));
          In(i,j)= max(nh(:));
        
    end    
end

imshow(In)