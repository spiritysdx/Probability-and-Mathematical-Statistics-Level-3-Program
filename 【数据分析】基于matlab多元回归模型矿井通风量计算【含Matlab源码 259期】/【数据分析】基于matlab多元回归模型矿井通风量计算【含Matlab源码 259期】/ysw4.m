%% ������ʪ�������ӳ���ϵ��ģ
clc,clear,close all
ysw1;               % ��������
data = data1;
n=size(data);
datay=data(:,2);   %��Ϊ ���� Ŀ�����
datax4=data(:,5);  %��Ϊ �¶� ����
datax5=data(:,6);  %��Ϊ ʪ�� ����
figure('Color',[1 1 1]);
subplot(121),scatter(datay,datax4,'.')
xlabel('����(m/s)');   ylabel('�¶�');  grid off;  axis tight

subplot(122),scatter(datay,datax5,'.')
xlabel('����(m/s)');   ylabel('ʪ��');  grid off;  axis tight