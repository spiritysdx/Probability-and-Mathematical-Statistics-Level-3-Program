clc,clear,close all
ysw1 = xlsread("����.xlsx");        % ��������
x=[v1,v3, v4];      % ����
y=[Pc1, Pc3 ,Pc4];  % ú��
figure('color',[1 1 1])
scatter(x,y,'.')
xlabel('����(m/s)');  ylabel(' ú��Ũ��(g/m3)');  grid off; axis tight

p = polyfit(x,y,1)  % ���
Pc=p(1)*x+p(2);
hold on
plot(x,Pc,'r*--')

%% ��������˹Ũ�������ӳ���ϵ��ģ
clc,clear,close all
ysw1 = xlsread("����.xlsx");               % ��������
x=[v1,v4];          % ����
y=[Pg1,Pg4];        % ��˹
figure('color',[1 1 1])
scatter(x,y,'.')
xlabel('����(m/s)');  ylabel(' ú��Ũ��(g/m3)');  grid off; axis tight

p = polyfit(x,y,1)  % ���
Pc=p(1)*x+p(2);
hold on
plot(x,Pc,'r*--')

%% ������ʪ�������ӳ���ϵ��ģ
clc,clear,close all
ysw1 = xlsread("����.xlsx");               % ��������
data = data1;
n=size(data);
datay=data(:,2);   %��Ϊ ���� Ŀ�����
datax4=data(:,5);  %��Ϊ �¶� ����
datax5=data(:,6);  %��Ϊ ʪ�� ����
figure('Color',[1 1 1]);
subplot(121),scatter(datay,datax4,'.')
xlabel('����(m/s)');   ylabel('�¶�');  grid off;  axis tight
clc,clear,close all
format long
ysw1 = xlsread("����.xlsx");        % ��������
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
        yu(i,j-1)=yuc(i,j-1)*a1(1,j)+a(1,j);   %����һ������
    end
end

figure('color',[1 1 1])
plot(data1(:,1),data1(:,2),'r.-','linewidth',2)
hold on
plot(data1(:,1),yu,'bo-','linewidth',2)
xlabel('ʱ���');  ylabel(' ͨ����');  grid off; axis tight
legend('ԭʼ�ź�','�ع�Ԥ��')

error_hg= data1(:,2)-yu;
save error_hg.mat error_hg

