%iterating over the images:
files=dir("*.tif");
max_y=[];
for i = 1:numel(files)
    filename=files(i).name;
    I=imread(filename);
    
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
    hold on
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
    pos_x=[];
    
    %structure with the x and y coordinates of the images pixels:
    struct(i).x=pt(:,1);
    struct(i).y=pt(:,2);
    max_y=[max_y; max(struct(i).y)];
end


for i=1:(numel(files)-1)
    diff(i).x = struct(i+1).x - struct(i).x;
    diff(i).y=struct(i+1).y-struct(i).y;
end

% finding the time period:
timeperiod=[];
for i=1:numel(files)
    %finding the x-value for when the max y occurs:
    [max_y_t, index]=max(struct(i).y);
    max_x_t=struct(i).x(index);
    for j=1:size(struct(i).x)
        if (struct(i).x(j)==max_x_t)
            if (struct(i).y(j)>=max_y_t) %&& struct(i).y(j)<=max_y_t)
                timeperiod=[timeperiod; i j struct(i).x(j) struct(i).y(j)];
            end 
        end
    end
end

%finding the x and y velocities for a pixel:
yvel=[];
x_fix=struct(1).x(10); %randomly picked
for i=1:numel(files)
    yvel=[yvel; struct(i).y(10)];
end

yvel_diff=[];
for i=1:(numel(files)-1)
    yvel_diff=[yvel_diff; yvel(i+1)-yvel(i)];
end









