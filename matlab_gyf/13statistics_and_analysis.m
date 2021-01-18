%% statistics and analysis

%% mean() 函数 求平均数  
d = [1,3,5,5,5,5,7,9,9,9,10,13,14];
res = mean(d);
disp(res);

%OUTPUT:
%    7.3077



%% median() 函数 求中位数  
d = [1,3,5,5,5,5,7,9,9,9,10,13,14];
res = median(d);
disp(res);
%OUTPUT:
%    7



%% mode() 函数 Most frequent values in array  
d = [1,3,5,5,5,5,7,9,9,9,10,13,14];
res = mode(d);
disp(res);
%OUTPUT:
%    5

%% prctile() 函数 Percentiles of data set. 百分数
d = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49];
res = prctile(d,50); % 50  
disp(res);

res = prctile(d,25); % 25  
disp(res);

res = prctile(d,75); % 75  
disp(res);

%OUTPUT
%    40
%
%   20.2500
%
%   42.7500


%% range = max - min
d = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49];
range = max(d) - min(d);
disp(range);


%% interquartile range = q3 - q1
q1 = prctile(d,25); % 25  
q3 = prctile(d,75); % 75  
interquartile_range = q3 - q1;
disp(interquartile_range);


%% 方差 
d = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49];
S = var(d);
disp(S);
%OUTPUT:
%  251.9636


%% 标准差  
d = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49];
s = std(d);
disp(s);
%OUTPUT:
%   15.8734




%% 
x = 1:14;
freqy = [1 0 1 0 4 0 1 0 3 1 0 0 1 1];
subplot(1,3,1); bar(x,freqy); xlim([0 15]);
subplot(1,3,2); area(x,freqy); xlim([0 15]);
subplot(1,3,3); stem(x,freqy); xlim([0 15]);



%% 箱形图 Boxplot 
marks = [80  81 84 65 88 92 92 94 96 97];
boxplot(marks)
res = prctile(marks, [25 50 75]);
disp(res);

%OUTPUT:
%    81    90    94


%% 偏度 skewness()  
d = randn([100,3])*3; % 100x3  正态分布
idx= d(:,1) < 0;
d(idx,1) = 0;  % 第一列 小于0 都赋值为0  
d(d(:,3)>0,3) = 0;  % 第三列大于0 的都赋值为0 
boxplot(d, {'Right-skewed', 'Symmetric', 'Left-skewed'});
res = skewness(d);
disp(res);

%OUTPUT:
%    1.6558    0.2162   -1.9950

%%  kurtosis 峰度 
d = randn([100,3])*3; % 100x3  正态分布
k1 = kurtosis(d(:,1));
k2 = kurtosis(d(:,2));
k3 = kurtosis(d(:,3));
disp(k1);
disp(k2);
disp(k3);

%OUTPUT:
%    2.2985
%
%    3.2461
%
%    2.9984







