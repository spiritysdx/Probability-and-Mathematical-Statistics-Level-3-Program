clc,clear,close all
ysw1 = xlsread("数据.xlsx");        % 加载数据
x=[v1,v3, v4];      % 风速
y=[Pc1, Pc3 ,Pc4];  % 煤尘
figure('color',[1 1 1])
scatter(x,y,'.')
xlabel('风速(m/s)');  ylabel(' 煤尘浓度(g/m3)');  grid off; axis tight

p = polyfit(x,y,1)  % 拟合
Pc=p(1)*x+p(2);
hold on
plot(x,Pc,'r*--')

%% 空气中瓦斯浓度与风速映射关系建模
clc,clear,close all
ysw1 = xlsread("数据.xlsx");               % 加载数据
x=[v1,v4];          % 风速
y=[Pg1,Pg4];        % 瓦斯
figure('color',[1 1 1])
scatter(x,y,'.')
xlabel('风速(m/s)');  ylabel(' 煤尘浓度(g/m3)');  grid off; axis tight

p = polyfit(x,y,1)  % 拟合
Pc=p(1)*x+p(2);
hold on
plot(x,Pc,'r*--')

%% 矿井中温湿度与风速映射关系建模
clc,clear,close all
ysw1 = xlsread("数据.xlsx");               % 加载数据
data = data1;
n=size(data);
datay=data(:,2);   %作为 风速 目标变量
datax4=data(:,5);  %作为 温度 输入
datax5=data(:,6);  %作为 湿度 输入
figure('Color',[1 1 1]);
subplot(121),scatter(datay,datax4,'.')
xlabel('风速(m/s)');   ylabel('温度');  grid off;  axis tight
clc,clear,close all
format long
ysw1 = xlsread("数据.xlsx");        % 加载数据
n0=size(data1);
a=mean(data1);
a1=std(data1);
mstdata=zscore(data1);

figure('color',[1 1 1])
X=mstdata(:,3:6);
X=[ones(n0(1,1),1),X];
Y=mstdata(:,2); 
[b,bint,r,rint,s]=regress(Y,X)
rcoplot(r,rint)

yuc = b(1)+b(2)*mstdata(:,3)+b(3)*mstdata(:,4)+b(4)*mstdata(:,5)+b(5)*mstdata(:,6);
n1=size(yuc);
for i=1:n1(1,1)
    for j=2
        yu(i,j-1)=yuc(i,j-1)*a1(1,j)+a(1,j);   %反归一化操作
    end
end

figure('color',[1 1 1])
plot(data1(:,1),data1(:,2),'r.-','linewidth',2)
hold on
plot(data1(:,1),yu,'bo-','linewidth',2)
xlabel('时间点');  ylabel(' 通风量');  grid off; axis tight
legend('原始信号','回归预测')

error_hg= data1(:,2)-yu;
save error_hg.mat error_hg

