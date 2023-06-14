%% 矿井中温湿度与风速映射关系建模
clc,clear,close all
ysw1;               % 加载数据
data = data1;
n=size(data);
datay=data(:,2);   %作为 风速 目标变量
datax4=data(:,5);  %作为 温度 输入
datax5=data(:,6);  %作为 湿度 输入
figure('Color',[1 1 1]);
subplot(121),scatter(datay,datax4,'.')
xlabel('风速(m/s)');   ylabel('温度');  grid off;  axis tight

subplot(122),scatter(datay,datax5,'.')
xlabel('风速(m/s)');   ylabel('湿度');  grid off;  axis tight