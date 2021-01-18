%% 线性方程 和 线性系统 
% Linear Equation and Linear System 



                                                                         % 梯队
%% Gaussian Elimination rref()  Reduced row echelon form.
A = [1,2,1;2,6,1;1,1,4];
b = [2;7;3];
res = rref([A,b]);
disp(res);

%OUTPUT:
%     1     0     0    -3
%     0     1     0     2
%     0     0     1     1


%% LU Factorization
A = [1,1,1;2,3,5;4,6,8];
[L,U,P] = lu(A); % permutation(交换) matrix P so that P*A = L*U
                        % 交换矩阵 实现行交换  (因为主元位置出现0的情况需要进行 行交换 )
                        
disp(L);
disp(U);
disp(P);
disp('====');
disp(P*A);
disp(L*U);

%OUTPUT：
%    1.0000         0         0
%    0.2500    1.0000         0
%    0.5000         0    1.0000
%
%    4.0000    6.0000    8.0000
%         0   -0.5000   -1.0000
%         0         0    1.0000
%
%     0     0     1
%     1     0     0
%     0     1     0
%
%====
%     4     6     8
%     1     1     1
%     2     3     5
%
%     4     6     8
%     1     1     1
%     2     3     5

%% Cramer's method  inv() 函数  
A = [1,2,1;2,6,1;1,1,4];
b = [2;7;3];
x = inv(A)*b; 
disp(x);

%OUTPUT:
%   -3.0000
%    2.0000
%    1.0000


%% cond() 函数，来计算 一个矩阵 k值  越小越好 
A = [ 1 2 3; 2 4.0001 6; 9 8 7]; 
cond(A)
B = [ 1 2 3; 2 5 6; 9 8 7]; 
cond(B)

%OUTPUT
%ans =
%   4.3483e+05
%ans =
%   45.5623



%% Linear System 

%% eig() 函数  Find the eigenvalues and eigenvectors
A = [2,-12;1,-5];
[vec,diag] = eig(A);

disp(vec);
disp(diag);

%OUTPUT:
%    0.9701    0.9487  % 两个特征向量 [0.9701;0.2425]
%    0.2425    0.3162                          [0.9487;0.3162]
%
%    -1     0          % 两个特征值   -1  
%     0    -2                                -2  








