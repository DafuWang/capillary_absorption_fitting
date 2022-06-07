clf
clc
%clear all
%% ��һ����ʱ��������Ҫ�����ݵ�A��B��

t=[0:0.1:20];
% subplot(1,2,1);
figure(1)
plot(R(:,1),R(:,2)/1000,'ko');%ʵ������
hold on
plot(F,Y1,'k-','linewidth',2);%�������
hold on
plot(t,0.01844*sqrt(t),'k-','linewidth',1);%�����������
hold on
plot(R(:,3),R(:,4)/1000,'ro');%colorbar
hold on
plot(t2,Y2,'r-','linewidth',2);%colorbar
hold on
plot(t,0.01922*sqrt(t),'r-','linewidth',1);%�����������
xlabel('t/s');ylabel('h/m');
axis([0, 18, 0, 0.06]);

legend('ʵ������','�������','ֻ���Թ�������Ӱ����ʽ��','����������ճ����','����������Ӱ��','���������͹�������Ӱ��','ֻ���Թ�������Ӱ����ʽ��','��ֵ��','box','off');%'FontSize',12
legend('experimental data (r=0.00025m)',strcat('fitting (r=0.00025m):t=-',num2str(roundn(1/kk1,-2)),'*h-',num2str(roundn(hcc1_kk1,-2)),'*ln(1-',num2str(roundn(1/hcc1,-2)),'*h)'),'fitting (r=0.00025m):h=0.01844*sqrt(t)',...
       'experimental data (r=0.00020m)',strcat('fitting (r=0.00020m):t=-',num2str(roundn(1/kk2,-2)),'*h-',num2str(roundn(hcc2_kk2,-2)),'*ln(1-',num2str(roundn(1/hcc2,-2)),'*h)'),'fitting (r=0.00020m):h=0.01922*sqrt(t)',...
      'location',[0.395, 0.182, 0.56, 0.234],'box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);
annotation(figure(1),'rectangle',[0.091, 0.1021, 0.1321, 0.7444]);%��ӷ���
annotation(figure(1),'arrow',[0.223, 0.998],[0.169, 0.169]);%��Ӽ�ͷ
annotation(figure(1),'textbox',[0.93, 0.91, 0.045, 0.069],'String', '(a)','LineStyle','none', 'FitBoxToText','off'); 

figure(2)
% subplot(1,2,2);
plot(R(:,1),R(:,2)/1000,'ko');%ʵ������
hold on
plot(t1,Y1,'k-','linewidth',2);%�������
hold on
plot(t,0.01844*sqrt(t),'k-','linewidth',1);%�����������
hold on
plot(R(:,3),R(:,4)/1000,'ro');%colorbar
hold on
plot(t2,Y2,'r-','linewidth',2);%colorbar
hold on
plot(t,0.01922*sqrt(t),'r-','linewidth',1);%�����������
legend('ʵ������','�������','ֻ���Թ�������Ӱ����ʽ��','����������ճ����','����������Ӱ��','���������͹�������Ӱ��','ֻ���Թ�������Ӱ����ʽ��','��ֵ��','box','off');%'FontSize',12
legend('experimental data (r=0.00025m)',strcat('fitting (r=0.00025m):t=-',num2str(roundn(1/kk1,-2)),'*h-',num2str(roundn(hcc1_kk1,-2)),'*ln(1-',num2str(roundn(1/hcc1,-2)),'*h)'),'fitting (r=0.00025m):h=0.01844*sqrt(t)',...
       'experimental data (r=0.00020m)',strcat('fitting (r=0.00020m):t=-',num2str(roundn(1/kk2,-2)),'*h-',num2str(roundn(hcc2_kk2,-2)),'*ln(1-',num2str(roundn(1/hcc2,-2)),'*h)'),'fitting (r=0.00020m):h=0.01922*sqrt(t)',...
      'location','SouthEast','box','off');%'FontSize',12
xlabel('t/s');ylabel('h/m');
axis([0, 2.5, 0, 0.052]); 
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.1,0.1,0.88,0.88]); 
annotation(figure(2),'textbox',[0.93, 0.91, 0.045, 0.069],'String', '(b)','LineStyle','none', 'FitBoxToText','off');

