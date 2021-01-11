clear;
horizontal_mask = [-1 -1 -1; 2 2 2;-1 -1 -1];
vertical_mask = [-1 2 -1;-1 2 -1;-1 2 -1];
diagonal_1 = [-1 -1 2; -1 2 -1;2 -1 -1];
diagonal_2 = [2 -1 -1;-1 2 -1; -1 -1 2];

I =imread('line.png');
I2 =rgb2gray(I);
I3 =imbinarize(I2);

I_copy = I3;


for i=2 : size(I2,1)-1
    for j=2 : size(I2,2)-1
        neighbour_matrix  = horizontal_mask .*I_copy(i-1:i+1,j-1:j+1);
        avg1 = sum(neighbour_matrix(:));
        
        neighbour_matrix  = vertical_mask.*I_copy(i-1:i+1,j-1:j+1);
        avg2 = sum(neighbour_matrix(:));
        
        neighbour_matrix  = diagonal_1 .*I_copy(i-1:i+1,j-1:j+1);
        avg3 = sum(neighbour_matrix(:));
        
        neighbour_matrix  = diagonal_2 .*I_copy(i-1:i+1,j-1:j+1);
        avg4 = sum(neighbour_matrix(:));
        
         if I3(i,j)> max([avg1, avg2, avg3, avg4])
             I3(i,j) = 0;
         end
    end
end

% I3 = conv2(double(I3), horizontal_mask, 'same');
% I3 = conv2(double(I3), vertical_mask, 'same');
% I3 = conv2(double(I3), diagonal_1, 'same');
% I3 = conv2(double(I3), diagonal_2, 'same');

imshow(I);
figure
imshow(mat2gray(I3));