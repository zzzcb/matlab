%% ����ʽ��� 



%%  1 ʹ�� syms ���� sym()  

syms x; % ��ʱ x ����һ��������  
ret = x + x + x;
disp(ret);

ret2 = ret/4;
disp(ret2);
%OUTPUT:
%3*x
%(3*x)/4

sym('x'); % ��ʱ x ����һ��������  
ret = x + x + x;
disp(ret);

ret2 = ret/4;
disp(ret2);
%OUTPUT:
%3*x
%(3*x)/4

%% to define y = x^2 - 2x -8 
x = sym('x');
y = x^2 - 2*x -8; % y Ҳ�Զ��Ǹ� sym ��  
disp(y);


%% solve()  y = x*sin(x) -x = 0

syms x; % x �Ǹ����� 
res = solve('x*sin(x) - x',x);
disp(res); % res Ҳ�Ǹ����� 

% Ҳ�������� 
syms x;
y = x*sin(x) -x; % y Ҳ�Ǹ�����
res2 = solve(y,x); 
disp(res2);

%OUTPUT
%    0
% pi/2
% 
%    0
% pi/2

%% solve multiple equations 
syms x y;
eq1 = x - 2*y - 5;
eq2 = x +  y  - 6;
res = solve(eq1,eq2,x,y);
disp(res); % res �Ǹ� �ṹ�� 
disp(res.x); 
disp(res.y); 

%OUTPUT:
%    x: [1x1 sym]
%    y: [1x1 sym]
%
%    x: [1x1 sym]
%    y: [1x1 sym]
%
%17/3
% 
%1/3


%% 
syms a b x;
y = a*x^2 - b;
res1 = solve(y); % Ĭ���� x Ϊ δ֪��  
disp(res1);


res2 = solve(y,a); % �� a Ϊ δ֪��  
disp(res2);


res3 = solve(y,b); % �� b Ϊ δ֪��  
disp(res3);

%OUTPUT
%  b^(1/2)/a^(1/2)
% -b^(1/2)/a^(1/2)
% 
%b/x^2
% 
%a*x^2


%% Exercise   
% 1 
syms a b x y r;
eq = (x-a)^2 + (y-b)^2 - r^2;
res = solve(eq,x);
disp(res);

%OUTPUT 
% a + (b + r - y)^(1/2)*(r - b + y)^(1/2)
% a - (b + r - y)^(1/2)*(r - b + y)^(1/2)


% 2 
syms a b c d;
m = [a b;c d];
res2 = inv(m); % inv() Matrix inverse
disp(res2);
disp(m*res2);

%OUTPUT
%[  d/(a*d - b*c), -b/(a*d - b*c)]
%[ -c/(a*d - b*c),  a/(a*d - b*c)]
%  
%[ (a*d)/(a*d - b*c) - (b*c)/(a*d - b*c),                                     0] % û�л��� 
%[                                     0, (a*d)/(a*d - b*c) - (b*c)/(a*d - b*c)]


%% symbolic differentitation  diff()  
syms x;
y = 4*x^5;
res = diff(y); 
disp(res);  

%OUTPUT:
%20*x^4


%% Exercise 
%1 
syms x y;
f = exp(x^2) /(x^3 - x + 3);
res = diff(f,x);
disp(res);

%2 
g = (x^2 + x*y - 1 )/(y^3 + x+ 3);  
res2 = diff(g,x);
disp(res2);

%OUTPUT:
%(2*x*exp(x^2))/(x^3 - x + 3) - (exp(x^2)*(3*x^2 - 1))/(x^3 - x + 3)^2
% 
%(2*x + y)/(y^3 + x + 3) - (x^2 + y*x - 1)/(y^3 + x + 3)^2




%% symbolic integration  int()  
syms x;
y = x^2*exp(x);
z = int(y);
disp(z);
z = z-subs(z, x, 0); % subs �� �������˼����z �У�x��0ȡ��
disp(z);

%OUTPUT 
%exp(x)*(x^2 - 2*x + 2)
% 
%exp(x)*(x^2 - 2*x + 2) - 2


%% Exercise 
syms x;
f = (x^2 - x+1) /(x+3);
F = int(f);
disp(F);
res = subs(F,x,10) - subs(F,x,0);
disp(res);

%OUTPUT:
%13*log(x + 3) - 4*x + x^2/2
%13*log(13) - 13*log(3) + 10


%% fsolve() ����  
f = @(x) 1.2*x + 0.3 + x*sin(x);
ret = fsolve(f,0); % ��ʼ��  ���²�һ������
disp(ret);

%OUTPUT
%Equation solved.
%
%fsolve completed because the vector of function values is near zero
%as measured by the default value of the function tolerance, and
%the problem appears regular as measured by the gradient.
%
%<stopping criteria details>
%
%   -0.3500




%% Exercise 
f = @(x) [2*x(1) - x(2) - exp(-x(1));-x(1)+2*x(2)-exp(-x(2))];
res = fsolve(f,[-5,-5]);
disp(res);

%OUTPUT
%Equation solved.
%
%fsolve completed because the vector of function values is near zero
%as measured by the default value of the function tolerance, and
%the problem appears regular as measured by the gradient.
%
%<stopping criteria details>
%
%    0.5671    0.5671


%% fzero() ����  
f = @(x) x.^2;
res1 = fzero(f,0.2); % guess value is 0.2 
disp(res1); 

res2 = fsolve(f,0.2); 
disp(res2);

%OUTPUT:
%    NaN ��Ϊû�� cross the x axis 
%
%    0.0063

%% fsolve() fzero() ��options 
f = @(x) x.^2;
                                  %tolerance ƫ�� 
options = optimset('MaxIter',1e3,'TolFun',1e-10);
res = fsolve(f,0.1,options);
disp(res);
res2 = fzero(f,0.1,options);
disp(res2);

%OUTPUT:
%Equation solved.
%
%fsolve completed because the vector of function values is near zero
%as measured by the selected value of the function tolerance, and
%the problem appears regular as measured by the gradient.
%
%<stopping criteria details>
%
%   1.9532e-04
%
%Exiting fzero: aborting search for an interval containing a sign change
%    because NaN or Inf function value encountered during search.
%(Function value at -1.37296e+154 is Inf.)
%Check function or try again with a different starting value.
%   NaN


%% 
f = @(x) x.^2 - 2; % cross the x axis 

res3 = fzero(f,1.4); % guess value is 1.4 
disp(res3); 

res4 = fsolve(f,1.4);
disp(res4); 

res3 = fzero(f,-1.4); % guess value is -1.4 
disp(res3); 

res4 = fsolve(f,-1.4);
disp(res4); 

%OUTPUT:
%
%    1.4142
%
%
%Equation solved.
%
%fsolve completed because the vector of function values is near zero
%as measured by the default value of the function tolerance, and
%the problem appears regular as measured by the gradient.
%
%<stopping criteria details>
%
%    1.4142
%
%   -1.4142
%
%
%Equation solved.
%
%fsolve completed because the vector of function values is near zero
%as measured by the default value of the function tolerance, and
%the problem appears regular as measured by the gradient.
%
%<stopping criteria details>
%
%   -1.4142


%% roots() ����  only works for polynomials 

res = roots([1,-3.5,2.75,2.125,-3.875,1.25]);
disp(res);

%OUTPUT:
%   2.0000 + 0.0000i
%  -1.0000 + 0.0000i
%   1.0000 + 0.5000i
%   1.0000 - 0.5000i
%   0.5000 + 0.0000i



