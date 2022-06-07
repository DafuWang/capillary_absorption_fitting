clf
clc
%clear all
%% 第一运行时，复制想要的数据到A和B里
%第一次去掉下面四行的注释，复制想要的数据后加上前两行的注释
% tn=1;
%N=[tn,hn,tn1,hn1];
save N
r=0.0002;
 Gam=0.072;Rho=1000; g=9.8;r1=0.0002;%r2=0.0002;%计算阐述
 kk2=0.02112;hcc2_kk2=2.68;hcc2=0.0502;
 k1=kk2;hc1_k1=hcc2_kk2;hc1=hcc2;%kk1越小上的越快，hcc1_kk1越小上的越慢
 Y1=[0:0.0000648999:0.0502];%[0:0.000448999:0.0441];%自定的高度变化
 t1=-1/k1.*Y1-hc1_k1.*log(1-Y1./hc1);%拟合的时间t变化
 %% 水的粘度和接触角参数的反算
 Eta1=Rho*g*r1^2/(8*k1);%用模拟结果反算水的粘度
 rcs1=hc1*Rho*g*r1/2;%基于第三个参数模拟结果反算接触角的余玄与表面张力的值
 Theta1=acosd(rcs1/Gam);%用模拟结果反算接触角
%  rcs11=hc1_k1*k1*Rho*g*r1/2;
%  Theta1=acosd(rcs11/Gam)
%% 画图
Y10=[0:0.00000000648999:0.0502];%[0:0.00000000448999:0.045021];%自定的高度变化
T10=-1/k1.*Y10-hc1/k1.*log(1-Y10/hc1);%只忽略惯性力的影响隐式解时间t的变化

t=[0:0.1:20];
Y11=2*sqrt(Gam*cosd(Theta1)/Rho/r1).*t;
Y12=sqrt(2)*sqrt(Gam*cosd(Theta1)*r1/(4*Eta1).*t+Gam*Rho*r1^3*cosd(Theta1)/(Eta1)^2/32.*(exp(-8*Eta1/Rho/r1^2.*t)-1));%忽略重力的影响
Y13=sqrt(Gam*cosd(Theta1)/2/Eta1*r1.*t);%忽略重力和惯性力的影响
x=-exp(-1-Rho^2*g^2*r1^3.*t/(16* Gam*Eta1*cosd(Theta1)));
W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
Y14=real(2*Gam*cosd(Theta1)./( Rho*g*r1).*(1+W));%只忽略惯性力的影响

figure(1)
plot(R(:,3),R(:,4)/1000,'ko');%实验数据
hold on
plot(t1,Y1,'k-','linewidth',2);%拟合数据
hold on
plot(T10,Y10,'b-','linewidth',1);%只忽略惯性力的影响隐式解
hold on
plot(t,Y11,'y-','linewidth',2);%忽略重力和粘性力
hold on
plot(t,Y12,'r-','linewidth',2);%忽略重力的影响
hold on
plot(t,Y13,'ro','linewidth',2);%忽略重力和惯性力的影响
hold on
plot(t,Y14,'bo','linewidth',1);%只忽略惯性力的影响显式解
hold on
plot(N(:,3),N(:,4),'g*','linewidth',1);%数值解
%% 设定图例，坐标
xlabel('t/s');ylabel('h/m');
axis([0, 2.5, 0, 0.05]);
legend('experimental data','fitting by model','implicit solution without inertia','analytical solution without gravity and viscous force',...
       'analytical solution without gravity','analytical solution without gravity and inertia','explicit solution without inertia','numerical solution',...
       'Position',[0.39 0.10, 0.57, 0.31],'box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);   
annotation(figure(1),'textbox',[0.93, 0.91, 0.045, 0.069],'String', '(b)','LineStyle','none', 'FitBoxToText','off'); 
annotation(figure(1),'textbox',[0.155 0.76 0.33 0.183],'String',strcat('r=',num2str(r1), 'mm \theta=',num2str(roundn(Theta1,-2)),'\circ \eta=',num2str(roundn(Eta1,-4)),'N \cdot m^-^2 \cdot s^-^1'), 'LineStyle','none', 'FitBoxToText','off');


figure(2)
plot(R(:,3),R(:,4)/1000,'ko');%实验数据
hold on
plot(t1,Y1,'k-','linewidth',2);%拟合数据
hold on
plot(T10,Y10,'b-','linewidth',1);%只忽略惯性力的影响隐式解
hold on
plot(t,Y11,'y-','linewidth',2);%忽略重力和粘性力
hold on
plot(t,Y12,'r-','linewidth',2);%忽略重力的影响
hold on
plot(t,Y13,'ro','linewidth',2);%忽略重力和惯性力的影响
hold on
plot(t,Y14,'bo','linewidth',1);%只忽略惯性力的影响显式解
hold on
plot(N(:,3),N(:,4),'g*','linewidth',1);%数值解
%% 设定图例，坐标
xlabel('t/s');ylabel('h/m');
axis([0, 20, 0, 0.16]);
legend('experimental data','fitting by model','implicit solution without inertia','analytical solution without gravity and viscous force',...
       'analytical solution without gravity','analytical solution without gravity and inertia','explicit solution without inertia','numerical solution',...
       'Position',[0.405 0.35 0.57 0.31],'box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]); 

annotation(figure(2),'rectangle',[0.11 0.10 0.11 0.2]);%添加方框
annotation(figure(2),'arrow',[0.223, 0.998],[0.169, 0.169]);%添加箭头
annotation(figure(2),'textbox',[0.93, 0.91, 0.045, 0.069],'String', '(a)','LineStyle','none', 'FitBoxToText','off');
annotation(figure(2),'textbox',[0.155 0.76 0.33 0.183],'String',strcat('r=',num2str(r1), 'mm \theta=',num2str(roundn(Theta1,-2)),'\circ \eta=',num2str(roundn(Eta1,-4)),'N \cdot m^-^2 \cdot s^-^1'), 'LineStyle','none', 'FitBoxToText','off');


