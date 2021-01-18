%% statistics and analysis

%% mean() ���� ��ƽ����  
d = [1,3,5,5,5,5,7,9,9,9,10,13,14];
res = mean(d);
disp(res);

%OUTPUT:
%    7.3077



%% median() ���� ����λ��  
d = [1,3,5,5,5,5,7,9,9,9,10,13,14];
res = median(d);
disp(res);
%OUTPUT:
%    7



%% mode() ���� Most frequent values in array  
d = [1,3,5,5,5,5,7,9,9,9,10,13,14];
res = mode(d);
disp(res);
%OUTPUT:
%    5

%% prctile() ���� Percentiles of data set. �ٷ���
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


%% ���� 
d = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49];
S = var(d);
disp(S);
%OUTPUT:
%  251.9636


%% ��׼��  
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



%% ����ͼ Boxplot 
marks = [80  81 84 65 88 92 92 94 96 97];
boxplot(marks)
res = prctile(marks, [25 50 75]);
disp(res);

%OUTPUT:
%    81    90    94


%% ƫ�� skewness()  
d = randn([100,3])*3; % 100x3  ��̬�ֲ�
idx= d(:,1) < 0;
d(idx,1) = 0;  % ��һ�� С��0 ����ֵΪ0  
d(d(:,3)>0,3) = 0;  % �����д���0 �Ķ���ֵΪ0 
boxplot(d, {'Right-skewed', 'Symmetric', 'Left-skewed'});
res = skewness(d);
disp(res);

%OUTPUT:
%    1.6558    0.2162   -1.9950

%%  kurtosis ��� 
d = randn([100,3])*3; % 100x3  ��̬�ֲ�
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







