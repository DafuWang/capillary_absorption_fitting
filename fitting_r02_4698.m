clf
clc
%clear all
%% ��һ����ʱ��������Ҫ�����ݵ�A��B��
%��һ��ȥ���������е�ע�ͣ�������Ҫ�����ݺ����ǰ���е�ע��
% tn=1;
%N=[tn,hn,tn1,hn1];
save N
r=0.0002;
 Gam=0.072;Rho=1000; g=9.8;r1=0.0002;%r2=0.0002;%�������
 kk2=0.02112;hcc2_kk2=2.68;hcc2=0.0502;
 k1=kk2;hc1_k1=hcc2_kk2;hc1=hcc2;%kk1ԽС�ϵ�Խ�죬hcc1_kk1ԽС�ϵ�Խ��
 Y1=[0:0.0000648999:0.0502];%[0:0.000448999:0.0441];%�Զ��ĸ߶ȱ仯
 t1=-1/k1.*Y1-hc1_k1.*log(1-Y1./hc1);%��ϵ�ʱ��t�仯
 %% ˮ��ճ�ȺͽӴ��ǲ����ķ���
 Eta1=Rho*g*r1^2/(8*k1);%��ģ��������ˮ��ճ��
 rcs1=hc1*Rho*g*r1/2;%���ڵ���������ģ��������Ӵ��ǵ����������������ֵ
 Theta1=acosd(rcs1/Gam);%��ģ��������Ӵ���
%  rcs11=hc1_k1*k1*Rho*g*r1/2;
%  Theta1=acosd(rcs11/Gam)
%% ��ͼ
Y10=[0:0.00000000648999:0.0502];%[0:0.00000000448999:0.045021];%�Զ��ĸ߶ȱ仯
T10=-1/k1.*Y10-hc1/k1.*log(1-Y10/hc1);%ֻ���Թ�������Ӱ����ʽ��ʱ��t�ı仯

t=[0:0.1:20];
Y11=2*sqrt(Gam*cosd(Theta1)/Rho/r1).*t;
Y12=sqrt(2)*sqrt(Gam*cosd(Theta1)*r1/(4*Eta1).*t+Gam*Rho*r1^3*cosd(Theta1)/(Eta1)^2/32.*(exp(-8*Eta1/Rho/r1^2.*t)-1));%����������Ӱ��
Y13=sqrt(Gam*cosd(Theta1)/2/Eta1*r1.*t);%���������͹�������Ӱ��
x=-exp(-1-Rho^2*g^2*r1^3.*t/(16* Gam*Eta1*cosd(Theta1)));
W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
Y14=real(2*Gam*cosd(Theta1)./( Rho*g*r1).*(1+W));%ֻ���Թ�������Ӱ��

figure(1)
plot(R(:,3),R(:,4)/1000,'ko');%ʵ������
hold on
plot(t1,Y1,'k-','linewidth',2);%�������
hold on
plot(T10,Y10,'b-','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(t,Y11,'y-','linewidth',2);%����������ճ����
hold on
plot(t,Y12,'r-','linewidth',2);%����������Ӱ��
hold on
plot(t,Y13,'ro','linewidth',2);%���������͹�������Ӱ��
hold on
plot(t,Y14,'bo','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(N(:,3),N(:,4),'g*','linewidth',1);%��ֵ��
%% �趨ͼ��������
xlabel('t/s');ylabel('h/m');
axis([0, 2.5, 0, 0.05]);
legend('experimental data','fitting by model','implicit solution without inertia','analytical solution without gravity and viscous force',...
       'analytical solution without gravity','analytical solution without gravity and inertia','explicit solution without inertia','numerical solution',...
       'Position',[0.39 0.10, 0.57, 0.31],'box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);   
annotation(figure(1),'textbox',[0.93, 0.91, 0.045, 0.069],'String', '(b)','LineStyle','none', 'FitBoxToText','off'); 
annotation(figure(1),'textbox',[0.155 0.76 0.33 0.183],'String',strcat('r=',num2str(r1), 'mm \theta=',num2str(roundn(Theta1,-2)),'\circ \eta=',num2str(roundn(Eta1,-4)),'N \cdot m^-^2 \cdot s^-^1'), 'LineStyle','none', 'FitBoxToText','off');


figure(2)
plot(R(:,3),R(:,4)/1000,'ko');%ʵ������
hold on
plot(t1,Y1,'k-','linewidth',2);%�������
hold on
plot(T10,Y10,'b-','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(t,Y11,'y-','linewidth',2);%����������ճ����
hold on
plot(t,Y12,'r-','linewidth',2);%����������Ӱ��
hold on
plot(t,Y13,'ro','linewidth',2);%���������͹�������Ӱ��
hold on
plot(t,Y14,'bo','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(N(:,3),N(:,4),'g*','linewidth',1);%��ֵ��
%% �趨ͼ��������
xlabel('t/s');ylabel('h/m');
axis([0, 20, 0, 0.16]);
legend('experimental data','fitting by model','implicit solution without inertia','analytical solution without gravity and viscous force',...
       'analytical solution without gravity','analytical solution without gravity and inertia','explicit solution without inertia','numerical solution',...
       'Position',[0.405 0.35 0.57 0.31],'box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]); 

annotation(figure(2),'rectangle',[0.11 0.10 0.11 0.2]);%��ӷ���
annotation(figure(2),'arrow',[0.223, 0.998],[0.169, 0.169]);%��Ӽ�ͷ
annotation(figure(2),'textbox',[0.93, 0.91, 0.045, 0.069],'String', '(a)','LineStyle','none', 'FitBoxToText','off');
annotation(figure(2),'textbox',[0.155 0.76 0.33 0.183],'String',strcat('r=',num2str(r1), 'mm \theta=',num2str(roundn(Theta1,-2)),'\circ \eta=',num2str(roundn(Eta1,-4)),'N \cdot m^-^2 \cdot s^-^1'), 'LineStyle','none', 'FitBoxToText','off');


