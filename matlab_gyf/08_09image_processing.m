%% image read and show | change value
clear;
close all; % 关闭所有的figure 

I = imread('pout.tif');% 图片为matlab 内置的图片 
subplot(121);
imshow(I); % show 

% 对图像的数据进行操作
for i = 1:size(I,1)%size(I)[1]
    for j = 1:size(I,2)%size(I)[2]
        if mod(i,2) == 0 && mod(j,2)  == 0
            I(i,j) = 0;
        end
    end
end

subplot(122);
imshow(I); % show 

%% imageinfo() 
%I = imread('pout.tif');% 图片为matlab 内置的图片 
imageinfo('pout.tif'); % 获取文件的相关信息


%% imtool() 
imtool('pout.tif'); % isplay image in the Image Tool.  


%% immultiply() image 乘法 
I = imread('rice.png');% 内置的图片
subplot(121);
imshow(I);

J = immultiply(I,1.5);
subplot(122);
imshow(J);


%% imadd() image 加法 
I = imread('rice.png');% 内置的图片
J = imread('cameraman.tif');% 内置
K = imadd(I,J);

subplot(131);
imshow(I);

subplot(132);
imshow(J);

subplot(133);
imshow(K);

%% imhist() isplay histogram of image data.
I = imread('pout.tif');% gray image
subplot(121);
imshow(I);
subplot(122);
imhist(I);

%% histeq()  直方图 均衡化 
I = imread('pout.tif');
I2 = histeq(I);
subplot(221);
imshow(I);
subplot(222);
imhist(I);

subplot(223);
imshow(I2);
subplot(224);
imhist(I2);

%% Image rotate 
I = imread('rice.png'); 
subplot(121);
imshow(I); 
J = imrotate(I, 35, 'bilinear');
subplot(122); 
imshow(J);
size(I)
size(J)

%% 不使用 imrotate 来实现 旋转 
jiaodu=45;                       %要旋转的角度，旋转方向为顺时针
img=imread('rice.png');       %这里v为原图像的高度，u为原图像的宽度
subplot(121)
imshow(img);                    %这里y为变换后图像的高度，x为变换后图像的宽度
[h w]=size(img);

theta=jiaodu/180*pi;%转换为弧度
rot=[cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1];
pix1=[1 1 1]*rot;               %变换后图像左上点的坐标
pix2=[1 w 1]*rot;               %变换后图像右上点的坐标
pix3=[h 1 1]*rot;               %变换后图像左下点的坐标
pix4=[h w 1]*rot;               %变换后图像右下点的坐标

height=round(max([abs(pix1(1)-pix4(1))+0.5 abs(pix2(1)-pix3(1))+0.5]));     %变换后图像的高度
width=round(max([abs(pix1(2)-pix4(2))+0.5 abs(pix2(2)-pix3(2))+0.5]));      %变换后图像的宽度
imgn=zeros(height,width);

delta_y=abs(min([pix1(1) pix2(1) pix3(1) pix4(1)]));            %取得y方向的负轴超出的偏移量
delta_x=abs(min([pix1(2) pix2(2) pix3(2) pix4(2)]));            %取得x方向的负轴超出的偏移量

for i=1-delta_y:height-delta_y
    for j=1-delta_x:width-delta_x
        pix=[i j 1]/rot;                                %用变换后图像的点的坐标去寻找原图像点的坐标，
        %否则有些变换后的图像的像素点无法完全填充
        float_Y=pix(1)-floor(pix(1));
        float_X=pix(2)-floor(pix(2));
        
        if pix(1)>=1 && pix(2)>=1 && pix(1) <= h && pix(2) <= w
            
            pix_up_left=[floor(pix(1)) floor(pix(2))];          %四个相邻的点
            pix_up_right=[floor(pix(1)) ceil(pix(2))];
            pix_down_left=[ceil(pix(1)) floor(pix(2))];
            pix_down_right=[ceil(pix(1)) ceil(pix(2))];
            
            value_up_left=(1-float_X)*(1-float_Y);              %计算临近四个点的权重
            value_up_right=float_X*(1-float_Y);
            value_down_left=(1-float_X)*float_Y;
            value_down_right=float_X*float_Y;
            
            imgn(i+delta_y,j+delta_x)=value_up_left*img(pix_up_left(1),pix_up_left(2))+ ...
                value_up_right*img(pix_up_right(1),pix_up_right(2))+ ...
                value_down_left*img(pix_down_left(1),pix_down_left(2))+ ...
                value_down_right*img(pix_down_right(1),pix_down_right(2));
        end
        
    end
end
subplot(122)
imshow(uint8(imgn))






%% 对一个灰度图进行 threshold 
I = imread('rice.png');
subplot(131);
imshow(I);
% 首先找出一个最优的threshold level 值,这里使用 graythresh() 
threshold_level = graythresh(I);%LEVEL is a normalized intensity value that lies in the range [0, 1]

subplot(132);
imhist(I); % 直方图
threshold_val = threshold_level*255; % 阈值  
ylim=get(gca,'Ylim'); % 获取当前图形的纵轴的范围
hold on;
plot([threshold_val,threshold_val],ylim);   

subplot(133);
bw = im2bw(I,threshold_level);
imshow(bw);

%% background estimation 
I = imread('rice.png');
subplot(131);
imshow(I);
BG = imopen(I,strel('disk',15)); 
subplot(132);
imshow(BG);

% BG in  3-d view 
x = 1:8:size(BG,1);
y = 1:8:size(BG,2);
[X,Y] = meshgrid(x,y);
Z = BG(x,y);
ax3 = subplot(133);
surf(X,Y,Z);  % 3d 图 
colormap(ax3,'jet');
set(gca,'xlim',[1,256])% image is 256x256
set(gca,'ylim',[1,256])
set(gca,'zlim',[0,255])%gray value is [0,255]
xlabel('x'); ylabel('y');zlabel('z');
axis square;


%% background 剔除 
I = imread('rice.png');
subplot(131);
imshow(I);
BG = imopen(I,strel('disk',15)); 
subplot(132);
imshow(BG);
I2 = I - BG;
subplot(133);
imshow(I2);

%% thresholding on Background Removed Image 
I = imread('rice.png');
subplot(221);
imshow(I);

subplot(222);
threshold_level = graythresh(I);
bw = im2bw(I,threshold_level);
imshow(bw);

subplot(223);
imshow(I);

subplot(224);
% 去除背景
BG = imopen(I,strel('disk',15)); 
I2 = I - BG;

threshold_level2 = graythresh(I2);
bw2 = im2bw(I2,threshold_level2);
imshow(bw2);

%% bwlabel()  
I=imread('rice.png');
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); 
threshold_level=graythresh(I2);
BW=im2bw(I2, threshold_level);
[labeled, numObjects]=bwlabel(BW, 8);% 参数 8是8连通（上下左右加四角）。也可以是4，4连通（上下左右）
                                                            % labeled
                                                            % 是标定的矩阵，它的大小和BW一致
                                                            
                                                            %  numObjects是总数  
%% What is the size of the largest grain?  What is the mean size of the grains?
I = imread('rice.png');
BG = imopen(I,strel('disk',15));
I2 = imsubtract(I,BG);
level = graythresh(I2);
BW = im2bw(I2,level);
[labeled,numObjects] = bwlabel(BW,8);
[heigh,width] = size(labeled);

largest = 0;%用于存储最大米粒的像素个数
sum = 0;%用于计算平均数前的总数
for num = 1:1:numObjects %用于迭代米粒的个数标号
    calc = 0;  %初始化每粒米个数
    for i = 1:1:heigh
        for j = 1:1:width
            if labeled(i,j) == num
                calc = calc + 1;
            end
        end
    end
    if calc > largest
        largest = calc;
    end
    sum = calc + sum;
end
disp(largest);
average = sum/numObjects;
disp(average);

%% label2rgb()
I=imread('rice.png');
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); 
threshold_level=graythresh(I2);
BW=im2bw(I2, threshold_level);
[labeled, numObjects]=bwlabel(BW, 8);
RGB_label=label2rgb(labeled); 
imshow(RGB_label);

%% regionprops() 

I=imread('rice.png');
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); 
threshold_level=graythresh(I2);
BW=im2bw(I2, threshold_level);
[labeled, numObjects]=bwlabel(BW, 8);
graindata = regionprops(labeled, 'basic');
disp(graindata);



%% bwselect
I=imread('rice.png');
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); 
threshold_level=graythresh(I2);
BW=im2bw(I2, threshold_level);
[labeled, numObjects]=bwlabel(BW, 8);

ObjI = bwselect(BW); 
imshow(ObjI);  % 用鼠标 左键选定后， 按 右键       




