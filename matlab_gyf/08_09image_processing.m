%% image read and show | change value
clear;
close all; % �ر����е�figure 

I = imread('pout.tif');% ͼƬΪmatlab ���õ�ͼƬ 
subplot(121);
imshow(I); % show 

% ��ͼ������ݽ��в���
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
%I = imread('pout.tif');% ͼƬΪmatlab ���õ�ͼƬ 
imageinfo('pout.tif'); % ��ȡ�ļ��������Ϣ


%% imtool() 
imtool('pout.tif'); % isplay image in the Image Tool.  


%% immultiply() image �˷� 
I = imread('rice.png');% ���õ�ͼƬ
subplot(121);
imshow(I);

J = immultiply(I,1.5);
subplot(122);
imshow(J);


%% imadd() image �ӷ� 
I = imread('rice.png');% ���õ�ͼƬ
J = imread('cameraman.tif');% ����
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

%% histeq()  ֱ��ͼ ���⻯ 
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

%% ��ʹ�� imrotate ��ʵ�� ��ת 
jiaodu=45;                       %Ҫ��ת�ĽǶȣ���ת����Ϊ˳ʱ��
img=imread('rice.png');       %����vΪԭͼ��ĸ߶ȣ�uΪԭͼ��Ŀ��
subplot(121)
imshow(img);                    %����yΪ�任��ͼ��ĸ߶ȣ�xΪ�任��ͼ��Ŀ��
[h w]=size(img);

theta=jiaodu/180*pi;%ת��Ϊ����
rot=[cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1];
pix1=[1 1 1]*rot;               %�任��ͼ�����ϵ������
pix2=[1 w 1]*rot;               %�任��ͼ�����ϵ������
pix3=[h 1 1]*rot;               %�任��ͼ�����µ������
pix4=[h w 1]*rot;               %�任��ͼ�����µ������

height=round(max([abs(pix1(1)-pix4(1))+0.5 abs(pix2(1)-pix3(1))+0.5]));     %�任��ͼ��ĸ߶�
width=round(max([abs(pix1(2)-pix4(2))+0.5 abs(pix2(2)-pix3(2))+0.5]));      %�任��ͼ��Ŀ��
imgn=zeros(height,width);

delta_y=abs(min([pix1(1) pix2(1) pix3(1) pix4(1)]));            %ȡ��y����ĸ��ᳬ����ƫ����
delta_x=abs(min([pix1(2) pix2(2) pix3(2) pix4(2)]));            %ȡ��x����ĸ��ᳬ����ƫ����

for i=1-delta_y:height-delta_y
    for j=1-delta_x:width-delta_x
        pix=[i j 1]/rot;                                %�ñ任��ͼ��ĵ������ȥѰ��ԭͼ�������꣬
        %������Щ�任���ͼ������ص��޷���ȫ���
        float_Y=pix(1)-floor(pix(1));
        float_X=pix(2)-floor(pix(2));
        
        if pix(1)>=1 && pix(2)>=1 && pix(1) <= h && pix(2) <= w
            
            pix_up_left=[floor(pix(1)) floor(pix(2))];          %�ĸ����ڵĵ�
            pix_up_right=[floor(pix(1)) ceil(pix(2))];
            pix_down_left=[ceil(pix(1)) floor(pix(2))];
            pix_down_right=[ceil(pix(1)) ceil(pix(2))];
            
            value_up_left=(1-float_X)*(1-float_Y);              %�����ٽ��ĸ����Ȩ��
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






%% ��һ���Ҷ�ͼ���� threshold 
I = imread('rice.png');
subplot(131);
imshow(I);
% �����ҳ�һ�����ŵ�threshold level ֵ,����ʹ�� graythresh() 
threshold_level = graythresh(I);%LEVEL is a normalized intensity value that lies in the range [0, 1]

subplot(132);
imhist(I); % ֱ��ͼ
threshold_val = threshold_level*255; % ��ֵ  
ylim=get(gca,'Ylim'); % ��ȡ��ǰͼ�ε�����ķ�Χ
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
surf(X,Y,Z);  % 3d ͼ 
colormap(ax3,'jet');
set(gca,'xlim',[1,256])% image is 256x256
set(gca,'ylim',[1,256])
set(gca,'zlim',[0,255])%gray value is [0,255]
xlabel('x'); ylabel('y');zlabel('z');
axis square;


%% background �޳� 
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
% ȥ������
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
[labeled, numObjects]=bwlabel(BW, 8);% ���� 8��8��ͨ���������Ҽ��Ľǣ���Ҳ������4��4��ͨ���������ң�
                                                            % labeled
                                                            % �Ǳ궨�ľ������Ĵ�С��BWһ��
                                                            
                                                            %  numObjects������  
%% What is the size of the largest grain?  What is the mean size of the grains?
I = imread('rice.png');
BG = imopen(I,strel('disk',15));
I2 = imsubtract(I,BG);
level = graythresh(I2);
BW = im2bw(I2,level);
[labeled,numObjects] = bwlabel(BW,8);
[heigh,width] = size(labeled);

largest = 0;%���ڴ洢������������ظ���
sum = 0;%���ڼ���ƽ����ǰ������
for num = 1:1:numObjects %���ڵ��������ĸ������
    calc = 0;  %��ʼ��ÿ���׸���
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
imshow(ObjI);  % ����� ���ѡ���� �� �Ҽ�       




