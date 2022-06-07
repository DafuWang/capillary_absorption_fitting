clf
clc
%clear all
%% 第一运行时，复制想要的数据到A和B里
%第一次去掉下面四行的注释，复制想要的数据后加上前两行的注释
A=[1.256*10^7,1.834*10^7,7.285*10^7,3.033*10^8,1.486*10^9];
C=[165.542,222.767,320.656,532.559,854.640];
B=[7.589*10^4,8.234*10^4,2.271*10^5,5.697*10^5,1.735*10^6];

satur=[0,20,40,60,80]';
k_matrix=[1./A'];
h_matrix=[1./C'];
hk_matrix=[1./B'];

figure(1)
plot(satur,k_matrix,'k*-'); 
xlabel('\theta/%'); ylabel('k/m\cdots^-^1'); 
set(gcf,'color','w')%设定背景
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.07,0.1,0.91,0.85]);
annotation(figure(1),'textbox',[0.92 0.89 0.0679 0.065],'String','(a)','LineStyle','none','FitBoxToText','off');

figure(2)
plot(satur,h_matrix,'ko-'); 
xlabel('\theta/%'); ylabel('I_c/m'); 
set(gcf,'color','w')%设定背景
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.072,0.1,0.91,0.85]);
annotation(figure(2),'textbox',[0.92 0.89 0.0679 0.065],'String','(b)','LineStyle','none','FitBoxToText','off');


figure(3)
plot(satur,hk_matrix,'ks-'); 
xlabel('\theta/%'); ylabel('\tau/s'); 
set(gcf,'color','w')%设定背景
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.072,0.1,0.91,0.85]);
annotation(figure(3),'textbox',[0.92 0.89 0.0679 0.065],'String','(c)','LineStyle','none','FitBoxToText','off');



