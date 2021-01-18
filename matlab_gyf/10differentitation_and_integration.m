%% Differentitation and Integration  微分 和 积分 


%% polyval()   计算x 在 f多项式下的值  
f = [9,-5,3,7]; % 多项式的系数  
x = -2:1:5; % x 值 
y = polyval(f,x);% y  值 。它按照 y = 9x^3 -5x^2+3x +7 计算y值   
plot(x,y);

%% polyder() 
f = [9,-5,3,7]; % 多项式的系数  
f_d = polyder(f);% f' 多项式的系数，即函数的导数 
disp(f_d); 


%% f(x) = 9x^3 -5x^2+3x +7 求 f'(7)
f_d = polyder([9,-5,3,7]);  % f'(x) 的系数  
ret = polyval(f_d,[7,]); % 求f'(x) 这个多项式在 x = 7 的值 
disp(ret); 


%% conv() 函数   Convolution and polynomial multiplication. 卷积与多项式乘法 （一维卷积）
% 所谓两个向量卷积，说白了就是多项式乘法
f1 = [5,-7,5,10]; %  第一个多项式的系数
f2 = [4,12,-3]; %  第二个多项式的系数
f = conv(f1,f2); % 一维卷积 f1*f2 之后 多项式的系数 

x = -2:0.1:1; % x值 
y = polyval(f,x); % y值
plot(x,y,'b--','linewidth',2);
hold on;

f_d = polyder(f);% f'(x) 的系数 
y2 = polyval(f_d,x); % y' 值 
plot(x,y2,'r-','linewidth',2);

legend('f(x)','f ''(x)');  % 输出单引号使用 转义字符无效，使用两个单引号即可








%% conv2() 函数  二维卷积 
X = ones([3,3]); % 3x3 
K = ones([3,3]); % 3x3 

disp('======full=======');  
ret = conv2(X,K); % default is full mode 
disp(ret);

disp('======same=======');  
ret2 = conv2(X,K,'same'); % default is full mode 
disp(ret2);

disp('======valid=======');  
ret3 = conv2(X,K,'valid'); % default is full mode 
disp(ret3);


%% polyint() 函数  
f = [5,0,-2,0,1]; % f(x) 多项式的系数 
f_int = polyint(f,3); % 常数项 constant 设置为3  
disp(f_int);

% 求 ∫ f(7)?
ret = polyval(f_int,7);
disp(ret);

%% diff() 函数 
x = [1,2,5,2,1];
ret = diff(x); %calculates the differences between adjacent elements of a vector。
                                             % 相邻的  
disp(ret);

%% Exercise: obtain the slope of a line between 2 points (1,5) and (2,7)
             % 获取      斜率 
x = [1,2];
y = [5,7];
slope = diff(y)/diff(x); % 斜率
disp(slope);


%%  
x0 = pi/2;
h = 0.1;
x = [x0,x0+h];
y = sin(x);
res = diff(y)/diff(x);
disp(res);


%% 
hs = [0.1,0.01,0.001,0.0001,0.00001,0.000001,0.0000001];
% f = @(x) x+1;

x0 = pi/2;
f = @(h) diff(sin([x0,x0+h]))/diff([x0,x0+h]);
for h = hs
    ret = f(h) - cos(pi/2); % cos(pi/2) 是精确值 
    disp(ret);
end


%%  前面是一个点的导数,这里是一个区间的导数 
h = 0.5;
x  = 0:h:2*pi;
y = sin(x);
ret = diff(y)./diff(x); % 多个值 除就要 加 . 了 ！  
disp(ret);

hold on;
plot(x,y,'b*-');
plot(x(1:size(x,2)-1),ret,'ro-'); % x 要少一个 

legend('sin(x)','sin''(x)','location','best');


%% 二次 和 三次 微分(导数)  
h = 0.5;
x = 0:h:2*pi;
%y = x.^3;
y = sin(x);
y_1 = diff(y)./diff(x);
y_2 = diff(y_1)./diff(x(1:end-1));
y_3 = diff(y_2)./diff(x(1:end-2));
hold on;
plot(x,y,'r.-');
plot(x(1:end-1),y_1,'g*-');
plot(x(1:end-2),y_2,'b+-');
plot(x(1:end-3),y_3,'cx-');

legend('sin(x)','sin''(x)','sin''''(x)','sin''''''(x)','location','best');

%%  ∫ 4x^3 dx [0,2]  midpoint 
h = 0.05; 
x = 0:h:2;
midpoint = ( x(1:end-1) + x(2:end) ) ./2;
s = 4*midpoint.^3 * h;
A =  sum(s);
disp(A);

%%  ∫ 4x^3 dx [0,2]  trapezoid  
f = @(x) 4*x.^3; % x is a vector 
h = 0.05; 
x = 0:h:2;
x1 = x(1:end-1);
x2 = x(2:end);

s = ( f(x1) + f(x2) ) /2 * h;  
A = sum(s);
disp(A); %   16.0100

%% 
h = 0.05; 
x = 0:h:2;
trapezoid = trapz(4*x.^3);% 它接收的参数是 每个点的y值  
                                        % 返回的是 sum ( f(x0)+f(x1) ) /2
A = trapezoid*h;  
disp(A); %    16.0100

%% 1/3 simpson's rule 
h = 0.05; 
x = 0:h:2; %  必须是 EVEN 段 ,也就是  EVEN + 1 个点。而且要取到 0 和 2  
y = 4*x.^3;
A = h/3*(y(1) +  4*sum(y(2:2:end)) + 2*sum(y(3:2:end-2))  + y(end));  
disp(A);


%% integral() 函数 
y = @(x) sin(x);  % 匿名函数  其实y 是个函数指针 
res = integral(y,0,pi);
disp(res); % 2.0000 

y2 = @(x) x.^2;  % 当然也可以对 多项式来积分  
res2 = integral(y2,0,1);
disp(res2); %     0.3333


%% 二重/ 三重积分  
f1 = @(x,y) y.*sin(x) + x.*cos(x);
res1 = integral2(f1,pi,2*pi,0,pi);
disp(res1); % -3.5864


f2 = @(x,y,z) y.*sin(x) + z.*cos(y);
res2 = integral3(f2,0,pi,0,1,-1,1);
disp(res2); % 2.0000





%% 函数 做为一个参数  
f1 = @(x) sin(x);
f2 = @(f,arg) f(arg); % 参数 f 为一个函数指针  

ret = f2(f1,pi/6);
disp(ret);

ret2 = f2(@cos,pi/6); % @cos 引用内置的函数 
disp(ret2);



