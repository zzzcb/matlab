%% special plots
x = logspace(-1,1,100); % yi 10 wei di 
y = x.^2;
subplot(221);
plot(x,y);
title('plot');

subplot(222);
semilogx(x,y);
title('semilogx');

subplot(223);
semilogy(x,y);
title('semilogy');

subplot(224);
loglog(x,y);
title('loglog');

%% plotyy()  left y label and right y label
x = 1:0.1:10;
y1 = sin(x);
y2 = 2*sin(2*x) + 1; 
[ax,h1,h2] = plotyy(x,y1,x,y2);% the handles of the two axes
                    % AX(1) is the left axes and AX(2) is the right axes.
set(get(ax(1),'ylabel'),'string','Left Y-axis')
set(get(ax(2),'ylabel'),'string','Right Y-axis')
title('Labeling plotyy');
set(h1,'linestyle','--'); 
set(h2,'linestyle',':');

%% histogram 
x  = randn(1,1000);  % Normally distributed ,x is 1x1000 martix 
subplot(211);
hist(x,10);  % bins is 10. 10 groups  
title('bins is 10')

subplot(212);
hist(x,50);  % bins is 50. 50 groups  
title('bins is 50')

%% bar charts 
x = 1:3; % 3 months 
y = randi([2,10],1,3); % random 2-10. shape is 1x3 matrix. 
subplot(221)
bar(x,y); 
set(gca,'xticklabel',{'jan','feb','mar'}); % change xtick to text 
title('bar single')
disp(x);
disp(y); 
disp('===');

subplot(222)
y2 = randi([2,10],1,3);
y3 = randi([2,10],1,3);
bar(x,[y;y2;y3]); % The length of X must match the number of rows of Y.
title('bar multiple')
disp(x);
disp([y;y2;y3]); 
disp('===');


subplot(223)
y = 1:3; % y axis 
z = randi([2,10],1,3); % z axis 
bar3(y,z); % y and z  
title('bar3 single')
disp(y);
disp(z); 
disp('===');

subplot(224)
y = 1:3; % y axis 
z = randi([2,10],1,3); % z axis 
z2 = randi([2,10],1,3); % z axis 
z3 = randi([2,10],1,3); % z axis 
bar3(y,[z;z2;z3]); % The length of Y must match the number of rows of Z.
title('bar3 multiple')
disp(y);
disp([z;z2;z3]); 
disp('===');

%% stacked and horizontal bar charts 

x = 1:3; % 3 months 
y = randi([2,10],1,3); % random 2-10. shape is 1x3 matrix. 
y2 = randi([2,10],1,3); 
y3 = randi([2,10],1,3); 
subplot(131)
bar(x,[y;y2;y3],'stacked'); 
title('stacked bar')

subplot(132);
barh(x,[y;y2;y3]);
title('horizontal bar');

subplot(133);
barh(x,[y;y2;y3],'stacked');
title('stacked horizontal bar');

disp(x);
disp([y;y2;y3]); 

%% Pie Charts 
x = [10 5 20 30];
subplot(221);
pie(x);


subplot(222);
pie(x,[0,0,0,1]);% 将最后一份分割出�?

subplot(223);
pie(x,[1,1,1,1]);% 每一份都分割�?�� 

subplot(224);
pie3(x,[0,0,0,1]);% 3d 绘图  



%% Polar Chart 
theta = 0:0.1*pi:pi/2;
r = 2*cos(theta);
subplot(121)
polar(theta,r);

theta2 = 0:0.1*pi:pi;
r2 = 2*cos(theta2);
subplot(122)
polar(theta2,r2);


%% Stairs and Stem Charts
x = linspace(0,4*pi,40);
y = sin(x);
subplot(121);
stairs(x,y);  % 阶梯�?
title('stairs');

subplot(122);
stem(x,y);  % 杆图 
title('stem');




%% Error Bar 
x = 0:pi/10:pi;
y = sin(x);
err = std(y)*ones(size(x));
errorbar(x,y,err);


%% fill
theta = [1:2:15]*pi/8;
x = cos(theta);
y = sin(theta);
subplot(121)
plot(x,y);axis square;


subplot(122)
fill(x,y,'r');axis square;


%% imagesc 
d = [0 2 4 3; 8 10 12 14; 16 18 20 22];
imagesc(d)
colorbar

d = [0 2 4 3; 8 10 12 14; 16 18 20 22];
imagesc(d)
colormap(hot); 
colorbar

%% built-in colormaps 
x = randi([0,255],10,1);
y = randi([0,255],1,10);
d = mod(x*y,255);
% imagesc(d);  % default colormap is PARULA

%colormap('jet');
%imagesc(d);

%% custom colormap 
x = [1:10; 3:12; 5:14];
myColorMap = zeros(256,3);
myColorMap(:,2) = (0:255)/255;
colormap(myColorMap);

imagesc(x);
colorbar;


%% 2d vs 3d

x=0:0.1:2*pi;


subplot(121);
plot(x,sin(x));
grid on
xlabel('x-axis'); ylabel('y-axis'); 

subplot(122);
plot3(x,sin(x),zeros(size(x)));
grid on
xlabel('x-axis'); ylabel('y-axis'); zlabel('z-axis');


%% surface plots 
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(121);
mesh(X,Y,Z);%3-D mesh surface.

subplot(122);
surf(X,Y,Z);%3-D colored surface.

%% contour 
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(121);
surf(X,Y,Z);%3-D colored surface.
axis square;

subplot(122);
contour(X,Y,Z);
axis square;


%% more contour 
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(121);
surf(X,Y,Z);%3-D colored surface.
axis square;

subplot(122);
[C,h] = contour(X,Y,Z);
clabel(C,h); % 标上数�?
axis square;

%% more contour 
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(121);
surf(X,Y,Z);%3-D colored surface.
axis square;

subplot(122);
[C,h] = contourf(X,Y,Z);% 涂上颜色  
clabel(C,h); 
axis square;


%% meshc() and surfc() 
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(121);
meshc(X,Y,Z);
axis square;

subplot(122);
surfc(X,Y,Z);
axis square;



%% view angle :view()
% Note:     AZ = -37.5, EL = 30 is the default 3-D view.
%           AZ = 0, EL = 90 is directly overhead and the default 2-D view.
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(121);
surf(X,Y,Z);
axis square;


subplot(122);
surf(X,Y,Z);
axis square;
view(0,90);

%% light
x = linspace(-3,3,20);
y = linspace(-4,4,20);
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(221);
surf(X,Y,Z);
axis square;
xlabel('x');
ylabel('y');
zlabel('z');

subplot(222);
surf(X,Y,Z);
axis square;
light('position',[0,0,0.5]);
hold on;  
plot3(0,0,0.5,'ro');

subplot(223);
surf(X,Y,Z);
axis square;
light('position',[5,5,0.5]);
hold on;  
plot3(5,5,0.5,'ro');

subplot(224);
surf(X,Y,Z);
axis square;
light('position',[-5,-5,0.5]);
hold on;  
plot3(-5,-5,0.5,'ro');




%% patch()  
x = [0,1,1,0];
y = [0,0,1,1];

subplot(231);
patch(x,y,'red')

x2 = [2,5; 2,5; 8,8];
y2 = [4,0; 8,2; 4,0];
subplot(232);
patch(x2,y2,'green')


v = [0, 0; 1 ,0; 1, 1; 0, 1];
f = [1,2,3];  % 指定要上颜色的面(3 个点)
subplot(233);
patch('faces',f,'vertices',v,'facecolor','red')


v = [0 0 0; 1 0 0 ; 1 1 0; 0 1 0; 0.25 0.25 1; ...
0.75 0.25 1; 0.75 0.75 1; 0.25 0.75 1]; 
f =  [1 2 3 4; 5 6 7 8; 1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8]; % 
subplot(234);
patch('faces',f,'vertices',v, 'facecolor', 'cyan');  
view(3); %3-d view 

v = [0 0 0; 1 0 0 ; 1 1 0; 0 1 0; 0.25 0.25 1; ...
0.75 0.25 1; 0.75 0.75 1; 0.25 0.75 1]; 
f =  [1 2 3 4; 5 6 7 8;  2 3 7 6; 3 4 8 7; 4 1 5 8]; % 没有这个面 1 2 6 5;
subplot(235);
patch('faces',f,'vertices',v, 'facecolor', 'cyan');  
view(3); %3-d view 








