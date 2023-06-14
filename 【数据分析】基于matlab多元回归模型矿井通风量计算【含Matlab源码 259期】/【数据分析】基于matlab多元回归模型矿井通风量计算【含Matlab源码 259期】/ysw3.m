%% 空气中瓦斯浓度与风速映射关系建模
clc,clear,close all
ysw1;               % 加载数据
x=[v1,v4];          % 风速
y=[Pg1,Pg4];        % 瓦斯
figure('color',[1 1 1])
scatter(x,y,'.')
xlabel('风速(m/s)');  ylabel(' 煤尘浓度(g/m3)');  grid off; axis tight

p = polyfit(x,y,1)  % 拟合
Pc=p(1)*x+p(2);
hold on
plot(x,Pc,'r*--')





