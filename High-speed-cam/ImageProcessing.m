img=imread('C:\Users\Anushtup Nandy\OneDrive\Documents\BITS\Projects\informal 2-2\fin\Image Processing on MATLAB\img_2.tif');

%converting to grayscale:
gray=rgb2gray(img);
%imshow(gray);

%binarizing:
bin=imbinarize(gray,0.95);
%imshow(bin);

%median filtering:
median=medfilt2(bin, [3,5]);
median2=medfilt2(median, [6,3]);
%imshow(median2);

%connecting the pixels: https://in.mathworks.com/help/images/ref/imclose.html?s_tid=doc_ta
se=strel('disk', 10);
conn=imclose(median2, se);
imshow(conn);

[rows, columns, numberOfColorChannels] = size(median2);
lineSpacing = 20; % Whatever you want.
stepSize=100;
for row = 1 : stepSize : rows
    yline(row, 'Color', 'r', 'LineWidth', 1);
end
for col = 1 : stepSize : columns
    xline(col, 'Color', 'r', 'LineWidth', 1);
end

hold on

