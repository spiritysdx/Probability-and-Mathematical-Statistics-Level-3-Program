%% ��������˹Ũ�������ӳ���ϵ��ģ
clc,clear,close all
ysw1;               % ��������
x=[v1,v4];          % ����
y=[Pg1,Pg4];        % ��˹
figure('color',[1 1 1])
scatter(x,y,'.')
xlabel('����(m/s)');  ylabel(' ú��Ũ��(g/m3)');  grid off; axis tight

p = polyfit(x,y,1)  % ���
Pc=p(1)*x+p(2);
hold on
plot(x,Pc,'r*--')





