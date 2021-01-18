%% 曲线拟合 和 插值 



%% polyfit() 函数 
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
fit = polyfit(x,y,2); % 拟合好的两个参数 
disp(fit);

% 将拟合好的结果 画出来  
xfit = [x(1):0.1:x(end)]; 
yfit = fit(1)*xfit + fit(2);
plot(x,y,'ro',xfit,yfit); %(x,y) 画点 (xfit,yfit)画线 
set(gca,'FontSize',14);
legend('data points','best-fit');

%% scatter()  and corrcoef() 
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
scatter(x,y); % 画散点图 
box on; 
axis square;
r = corrcoef(x,y); % x 和 y 的相关系数
disp(r); 

%OUTPUT: 
%       x               y
% x   1.0000(x 和 x)    0.9202 (x 和 y)
% y   0.9202(y 和 x)    1.0000 (y 和 y)


%% corrcoef()  扩展  
x = randn(6,1);
y = randn(6,1);
z = randn(6,1);
A = [x,y,z];   % x,y,z 分别是一个列向量  
r = corrcoef(A); % x 和 y 和 z 的相关系数
disp(A);
disp(r); 

%OUTPUT: 
%   -0.0450    0.6989    0.6261
%   -0.1024   -0.0259    1.1436
%   -0.3022    0.3281   -1.8217
%   -0.8536   -0.7011    0.2969
%   -0.7193   -2.1663    0.1585
%   -0.9170    0.0498    0.0461
%      x               y            z
%  x  1.0000(xx)    0.5515(xy)    0.1103(xz)
%  y  0.5515(yx)    1.0000(yy)   -0.1167(yz)
%  z  0.1103(zx)   -0.1167(zy)    1.0000(zz)



%% multiple linear regression 
load carsmall;
y = MPG;
x1 = Weight; x2 = Horsepower;
X = [ones(length(x1),1) x1 x2];
b = regress(y,X);
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT]=meshgrid(x1fit,x2fit);
YFIT=b(1)+b(2)*X1FIT+b(3)*X2FIT;
scatter3(x1,x2,y,'filled'); hold on;
mesh(X1FIT,X2FIT,YFIT); hold off;
xlabel('Weight');
ylabel('Horsepower');
zlabel('MPG'); view(50,10);

% [b,bint,r,rint,stats]=regress(y,X);

%% multiple linear regression 
load carsmall;
y = MPG;
x1 = Weight; x2 = Horsepower;
X = [ones(length(x1),1) x1 x2 x1.^2 x2.^2 x1.*x2];
b = regress(y,X);
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT]=meshgrid(x1fit,x2fit);
YFIT=b(1)+b(2)*X1FIT+b(3)*X2FIT + b(4)*X1FIT.^2 + b(5)*X2FIT.^2 + b(6)*X1FIT.*X2FIT;
scatter3(x1,x2,y,'filled'); hold on;
mesh(X1FIT,X2FIT,YFIT); hold off;
xlabel('Weight');
ylabel('Horsepower');
zlabel('MPG'); view(50,10);

% [b,bint,r,rint,stats]=regress(y,X);

%% interp1()   1-D interpolation 
X = 0:0.5:10; 
V = sin(X); 
hold on;
plot(X,V,'ro-');
Xq = 0:0.3:3; % new Xq 
Vq = interp1(X,V,Xq); 
plot(Xq,Vq,'g*')

%% spline()   Cubic spline data interpolation.
X = 0:0.5:10; 
V = sin(X); 
hold on;
plot(X,V,'ro-');
Xq = 0:0.3:3; % new Xq 
Vq = spline(X,V,Xq); 
plot(Xq,Vq,'g*')


%% interp2() 2D Interpolation
x = -2:.5:2; y = -2:.5:3;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
hold on;
surf(X,Y,Z);
plot3(X,Y,Z,'ro');

x_i = 0:0.3:2; % new  x 
y_i = 0:0.3:3; % new  y  
[X_i,Y_i] = meshgrid(x_i,y_i);
Z_i = interp2(X,Y,Z,X_i,Y_i); % new Z_i

plot3(X_i,Y_i,Z_i,'g*-');  

view(3); % 3-d view 


%% 2D Interpolation Using Spline
x = -2:.5:2; y = -2:.5:3;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);

x_i = 0:0.3:2; % new  x 
y_i = 0:0.3:3; % new  y  
[X_i,Y_i] = meshgrid(x_i,y_i);
Z_i = interp2(X,Y,Z,X_i,Y_i); % default is linear 
Z_i_2 = interp2(X,Y,Z,X_i,Y_i,'spline'); % new Z_i


subplot(121);
hold on;
surf(X,Y,Z);
plot3(X,Y,Z,'ro');
plot3(X_i,Y_i,Z_i,'g*-');
view(3);

subplot(122);
hold on;
surf(X,Y,Z);
plot3(X,Y,Z,'ro');
plot3(X_i,Y_i,Z_i_2,'g*-');
view(3);



