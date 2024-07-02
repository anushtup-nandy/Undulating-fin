
I = imread('Img000013.tif');

%gray+thresholding and median filtering:
gray=rgb2gray(I);
bin=imbinarize(gray,0.95);
median=medfilt2(bin, [3,5]);
B=medfilt2(median, [6 3]);


counter = 1;
p=[];
for rows = 1:1600
    for columns = 1:2560
        if B(rows,columns) ~= 0
                    p(counter,1) = columns;
                    p(counter,2) = 1600 - rows;
                    counter = counter + 1;
        end
    end
end

[temp, order] = sort(p(:,1));
answer=[];
answer = p(order,:);
new = [];
counter = 1;
while counter <= size(p(:,1),1)
    x = answer(counter,1);
    indices = find(answer(:,1)==x);
    result = max(answer(indices,2));
    new = [new; x result];
    counter = max(indices) + 1;
end

mirror_img = flip(B);
imshow(mirror_img);
hold on
% 
pt = interparc(200,new(:,1),new(:,2),'spline');
% 
plot(pt(:,1),pt(:,2),'r-*');
xlim([0 2560]);
ylim([0 1600]);


%iterating to get the velocities of every single point:
for x= 1:numel(new)

end