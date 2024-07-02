grayImage = imread('Img000013.tif');

subplot(2, 2, 1);
imshow(grayImage, []);
axis('on', 'image');

impixelinfo;
hFig = gcf;
hFig.WindowState = 'maximized'; % May not work in earlier versions of MATLAB.
drawnow;

[rows, columns, numberOfColorChannels] = size(grayImage);
if numberOfColorChannels > 1
	% It's not really gray scale like we expected - it's color.
	% Extract the red channel (so the magenta lines will be white).
	grayImage = grayImage(:, :, 2);
end

mask = bwareafilt(grayImage < 255, 1);
props = regionprops(mask, 'BoundingBox');
subplot(2, 2, 2);
grayImage = imcrop(grayImage, props.BoundingBox);
imshow(grayImage);
axis('on', 'image');

impixelinfo;
drawnow;
subplot(2, 2, 3);
imhist(grayImage);
grid on;


lowThreshold = 10;
highThreshold = 50;

mask = grayImage < highThreshold;
% Find out areas.
props = regionprops(mask, 'Area');
allAreas = sort([props.Area], 'Descend');
subplot(2, 2, 4);
% Keep areas only if they're bigger than 500 pixels and less than 2000 pixels.'
mask = bwareafilt(mask, [500, 1000]);
imshow(mask);

[labeledImage, numberOfBlobs] = bwlabel(mask, 8);
