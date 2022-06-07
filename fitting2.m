clf
clc
%clear all
%% 第一运行时，复制想要的数据到A和B里
%第一次去掉下面四行的注释，复制想要的数据后加上前两行的注释
% tn=1;
%  hn=2;
%   R=2;
Gam=0.072;Rho=1000; g=9.8;r1=0.00025;r2=0.0002;%计算阐述
save R
%% 画图
kk1=0.01612;hcc1_kk1=3.391;hcc1=0.0441;%kk1越小上的越快，hcc1_kk1越小上的越慢
kk2=0.03232;hcc2_kk2=2.55;hcc2=0.0502;

 Etaa1=Rho*g*r1^2/(8*kk1)
 Etaa2=Rho*g*r2^2/(8*kk2)
 Thetaa1=acosd(hcc1*Rho*g*r1/(2*Gam))
 Thetaa2=acosd(hcc2*Rho*g*r2/(2*Gam))
 Thetaa11=acosd(hcc1_kk1*k1*Rho*g*r1/(2*Gam)) 
 Thetaa21=acosd(hcc2_kk2*k2*Rho*g*r2/(2*Gam))

%大管
Y1=[0:0.000448999:0.0441];%自定的高度变化
t1=-1/kk1.*Y1-kk1_hcc1.*log(1-Y1./hcc1);%拟合的时间t变化
%小管
Y2=[0:0.0000648999:0.0502];%自定的高度变化
t2=-1/kk2.*Y2-kk2_hcc2.*log(1-Y2./hcc2);%拟合的时间t变化


t=[0:0.1:20];
% subplot(1,2,1);
figure(1)
plot(R(:,1),R(:,2)/1000,'ko');%实验数据
hold on
plot(t1,Y1,'k-','linewidth',2);%拟合数据
hold on
plot(t,0.01844*sqrt(t),'k-','linewidth',1);%根号拟合数据
hold on
plot(R(:,3),R(:,4)/1000,'ro');%colorbar
hold on
plot(t2,Y2,'r-','linewidth',2);%colorbar
hold on
plot(t,0.01922*sqrt(t),'r-','linewidth',1);%根号拟合数据
xlabel('t/s');ylabel('h/m');
axis([0, 18, 0, 0.06]);

legend('实验数据','拟合数据','只忽略惯性力的影响隐式解','忽略重力和粘性力','忽略重力的影响','忽略重力和惯性力的影响','只忽略惯性力的影响显式解','数值解','box','off');%'FontSize',12
legend('experimental data (r=0.00025m)',strcat('fitting (r=0.00025m):t=-',num2str(roundn(1/kk1,-2)),'*h-',num2str(roundn(hcc1_kk1,-2)),'*ln(1-',num2str(roundn(1/hcc1,-2)),'*h)'),'fitting (r=0.00025m):h=0.01844*sqrt(t)',...
       'experimental data (r=0.00020m)',strcat('fitting (r=0.00020m):t=-',num2str(roundn(1/kk2,-2)),'*h-',num2str(roundn(hcc2_kk2,-2)),'*ln(1-',num2str(roundn(1/hcc2,-2)),'*h)'),'fitting (r=0.00020m):h=0.01922*sqrt(t)',...
      'location',[0.395, 0.182, 0.56, 0.234],'box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);
annotation(figure(1),'rectangle',[0.091, 0.1021, 0.1321, 0.7444]);
annotation(figure(1),'arrow',[0.223, 0.998],[0.169, 0.169]);




% annotation(figure(1),'textbox',[0.258, 0.123, 0.199, 0.349],...
%      'String',{strcat('\eta_1 =',num2str(Etaa1)),strcat('\eta_2 =',num2str(Etaa2)),...
%      strcat('\theta_1=',num2str(Thetaa1)), strcat('\theta_2=',num2str(Thetaa2)),...
%      strcat('\theta_11=',num2str(Thetaa11)), strcat('\theta_21=',num2str(Thetaa21))},...
%      'LineWidth',1,'LineStyle','none','FitBoxToText','off');
 
figure(2)
% subplot(1,2,2);
plot(R(:,1),R(:,2)/1000,'ko');%实验数据
hold on
plot(t1,Y1,'k-','linewidth',2);%拟合数据
hold on
plot(t,0.01844*sqrt(t),'k-','linewidth',1);%根号拟合数据
hold on
plot(R(:,3),R(:,4)/1000,'ro');%colorbar
hold on
plot(t2,Y2,'r-','linewidth',2);%colorbar
hold on
plot(t,0.01922*sqrt(t),'r-','linewidth',1);%根号拟合数据
legend('实验数据','拟合数据','只忽略惯性力的影响隐式解','忽略重力和粘性力','忽略重力的影响','忽略重力和惯性力的影响','只忽略惯性力的影响显式解','数值解','box','off');%'FontSize',12
legend('experimental data (r=0.00025m)',strcat('fitting (r=0.00025m):t=-',num2str(roundn(1/kk1,-2)),'*h-',num2str(roundn(hcc1_kk1,-2)),'*ln(1-',num2str(roundn(1/hcc1,-2)),'*h)'),'fitting (r=0.00025m):h=0.01844*sqrt(t)',...
       'experimental data (r=0.00020m)',strcat('fitting (r=0.00020m):t=-',num2str(roundn(1/kk2,-2)),'*h-',num2str(roundn(hcc2_kk2,-2)),'*ln(1-',num2str(roundn(1/hcc2,-2)),'*h)'),'fitting (r=0.00020m):h=0.01922*sqrt(t)',...
      'location','SouthEast','box','off');%'FontSize',12
xlabel('t/s');ylabel('h/m');
axis([0, 2.5, 0, 0.052]); 
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.1,0.1,0.88,0.88]); 
