clf
clc
%clear all
%% ��һ����ʱ��������Ҫ�����ݵ�A��B��
%��һ��ȥ���������е�ע�ͣ�������Ҫ�����ݺ����ǰ���е�ע��
% tn=1;
% N=[tn,hn,tn1,hn1];
 save N

 Gam=0.072;Rho=1000; g=9.8;r1=0.00025;r2=0.0002;%�������
 
%  k1=0.0130966;hc1_k1=3.41;hc1=0.0441;%��ϵõ�������
%  Y1=[0:0.000448999:0.0441];%�Զ��ĸ߶ȱ仯
%  t1=-1/k1.*Y1-hc1_k1.*log(1-Y1./hc1);%��ϵ�ʱ��t�仯
 
 k2=0.0200240;hc2_k2=2.74;hc2=0.0502;%��ϵõ�������
 Y2=[0:0.0000761192:0.0502];
 t2=-1/0.0200240.*Y2-2.74.*log(1-Y2./0.0502); 
 %% ˮ��ճ�ȺͽӴ��ǲ����ķ���
 Eta2=Rho*g*r2^2/(8*k2);
 rcs2=hc2*Rho*g*r2/2;
 Theta2=acosd(rcs2/Gam);
% rcs22=hc2_k2*k2*Rho*g*r2/2;
% Theta22=acosd(rcs22/Gam);
%% ��ͼ

Y10=[0:0.00000000448999:0.045021];%�Զ��ĸ߶ȱ仯
T10=-1/k1.*Y10-hc1/k1.*log(1-Y10/hc1);%ֻ���Թ�������Ӱ����ʽ��ʱ��t�ı仯

Y20=[0:0.0000761192:0.0502];
T20=-1/k2.*Y2-hc2/k2.*log(1-Y2./hc2);

t=[0:0.1:20];
Y21=2*sqrt(Gam*cosd(Theta2)/Rho/r2).*t;
Y22=sqrt(2)*sqrt(Gam*cosd(Theta2)*r2/(4*Eta2).*t+Gam*Rho*r2^3*cosd(Theta2)/(Eta2)^2/32.*(exp(-8*Eta2/Rho/r2^2.*t)-1));%����������Ӱ��
Y23=sqrt(Gam*cosd(Theta2)/2/Eta2*r2.*t);%���������͹�������Ӱ��
x=-exp(-1-Rho^2*g^2*r2^3.*t/(16* Gam*Eta2*cosd(Theta2)));
W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
Y24=real(2*Gam*cosd(Theta2)./( Rho*g*r2).*(1+W));%ֻ���Թ�������Ӱ��


figure(1)
plot(R(:,3),R(:,4)/1000,'ko');%ʵ������
hold on
plot(t2,Y2,'k-','linewidth',2);%�������
hold on
plot(T20,Y20,'b-','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(t,Y21,'y-','linewidth',2);%����������ճ����
hold on
plot(t,Y22,'r-','linewidth',2);%����������Ӱ��
hold on
plot(t,Y23,'ro','linewidth',2);%���������͹�������Ӱ��
hold on
plot(t,Y24,'bo','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(N(:,3),N(:,4),'g*','linewidth',1);%��ֵ��
axis([0, 20, 0, 0.16]);
% legend('ʵ������','�������','ֻ���Թ�������Ӱ����ʽ��','����������ճ����','����������Ӱ��','���������͹�������Ӱ��','ֻ���Թ�������Ӱ����ʽ��','��ֵ��','box','off');%'FontSize',12
legend('experimental data','fitting by model','implicit solution without inertia','analytical solution without gravity and viscous force',...
    'analytical solution without gravity','analytical solution without gravity and inertia','explicit solution without inertia','numerical solution','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);%[0.11,0.1,0.87,0.88],[0.09,0.1,0.89,0.88]   
%% �趨ͼ��������
figure(1)
xlabel('t/s');ylabel('h/m');
%axis([0, 2.50, 0, 0.04]);
% set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);
% legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
% % legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
% annotation(figure(1),'textbox',[0.5,0.27,0.46,0.05],...
%     'String',{strcat('\theta =',num2str(THETA_W)),strcat('b=',num2str(b)),strcat('e=',num2str(e)),strcat('s=',num2str(s(5)))},...
%     'LineWidth',1,'LineStyle','none','FitBoxToText','off');
