%% Differentitation and Integration  ΢�� �� ���� 


%% polyval()   ����x �� f����ʽ�µ�ֵ  
f = [9,-5,3,7]; % ����ʽ��ϵ��  
x = -2:1:5; % x ֵ 
y = polyval(f,x);% y  ֵ �������� y = 9x^3 -5x^2+3x +7 ����yֵ   
plot(x,y);

%% polyder() 
f = [9,-5,3,7]; % ����ʽ��ϵ��  
f_d = polyder(f);% f' ����ʽ��ϵ�����������ĵ��� 
disp(f_d); 


%% f(x) = 9x^3 -5x^2+3x +7 �� f'(7)
f_d = polyder([9,-5,3,7]);  % f'(x) ��ϵ��  
ret = polyval(f_d,[7,]); % ��f'(x) �������ʽ�� x = 7 ��ֵ 
disp(ret); 


%% conv() ����   Convolution and polynomial multiplication. ��������ʽ�˷� ��һά�����
% ��ν�������������˵���˾��Ƕ���ʽ�˷�
f1 = [5,-7,5,10]; %  ��һ������ʽ��ϵ��
f2 = [4,12,-3]; %  �ڶ�������ʽ��ϵ��
f = conv(f1,f2); % һά��� f1*f2 ֮�� ����ʽ��ϵ�� 

x = -2:0.1:1; % xֵ 
y = polyval(f,x); % yֵ
plot(x,y,'b--','linewidth',2);
hold on;

f_d = polyder(f);% f'(x) ��ϵ�� 
y2 = polyval(f_d,x); % y' ֵ 
plot(x,y2,'r-','linewidth',2);

legend('f(x)','f ''(x)');  % ���������ʹ�� ת���ַ���Ч��ʹ�����������ż���








%% conv2() ����  ��ά��� 
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


%% polyint() ����  
f = [5,0,-2,0,1]; % f(x) ����ʽ��ϵ�� 
f_int = polyint(f,3); % ������ constant ����Ϊ3  
disp(f_int);

% �� �� f(7)?
ret = polyval(f_int,7);
disp(ret);

%% diff() ���� 
x = [1,2,5,2,1];
ret = diff(x); %calculates the differences between adjacent elements of a vector��
                                             % ���ڵ�  
disp(ret);

%% Exercise: obtain the slope of a line between 2 points (1,5) and (2,7)
             % ��ȡ      б�� 
x = [1,2];
y = [5,7];
slope = diff(y)/diff(x); % б��
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
    ret = f(h) - cos(pi/2); % cos(pi/2) �Ǿ�ȷֵ 
    disp(ret);
end


%%  ǰ����һ����ĵ���,������һ������ĵ��� 
h = 0.5;
x  = 0:h:2*pi;
y = sin(x);
ret = diff(y)./diff(x); % ���ֵ ����Ҫ �� . �� ��  
disp(ret);

hold on;
plot(x,y,'b*-');
plot(x(1:size(x,2)-1),ret,'ro-'); % x Ҫ��һ�� 

legend('sin(x)','sin''(x)','location','best');


%% ���� �� ���� ΢��(����)  
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

%%  �� 4x^3 dx [0,2]  midpoint 
h = 0.05; 
x = 0:h:2;
midpoint = ( x(1:end-1) + x(2:end) ) ./2;
s = 4*midpoint.^3 * h;
A =  sum(s);
disp(A);

%%  �� 4x^3 dx [0,2]  trapezoid  
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
trapezoid = trapz(4*x.^3);% �����յĲ����� ÿ�����yֵ  
                                        % ���ص��� sum ( f(x0)+f(x1) ) /2
A = trapezoid*h;  
disp(A); %    16.0100

%% 1/3 simpson's rule 
h = 0.05; 
x = 0:h:2; %  ������ EVEN �� ,Ҳ����  EVEN + 1 ���㡣����Ҫȡ�� 0 �� 2  
y = 4*x.^3;
A = h/3*(y(1) +  4*sum(y(2:2:end)) + 2*sum(y(3:2:end-2))  + y(end));  
disp(A);


%% integral() ���� 
y = @(x) sin(x);  % ��������  ��ʵy �Ǹ�����ָ�� 
res = integral(y,0,pi);
disp(res); % 2.0000 

y2 = @(x) x.^2;  % ��ȻҲ���Զ� ����ʽ������  
res2 = integral(y2,0,1);
disp(res2); %     0.3333


%% ����/ ���ػ���  
f1 = @(x,y) y.*sin(x) + x.*cos(x);
res1 = integral2(f1,pi,2*pi,0,pi);
disp(res1); % -3.5864


f2 = @(x,y,z) y.*sin(x) + z.*cos(y);
res2 = integral3(f2,0,pi,0,1,-1,1);
disp(res2); % 2.0000





%% ���� ��Ϊһ������  
f1 = @(x) sin(x);
f2 = @(f,arg) f(arg); % ���� f Ϊһ������ָ��  

ret = f2(f1,pi/6);
disp(ret);

ret2 = f2(@cos,pi/6); % @cos �������õĺ��� 
disp(ret2);



