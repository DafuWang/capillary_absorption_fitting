clf
clc
%clear all
%% ��һ����ʱ��������Ҫ�����ݵ�A��B��
%��һ��ȥ���������е�ע�ͣ�������Ҫ�����ݺ����ǰ���е�ע��
% tn=1;
%  hn=2;
%   R=2;
 Eta=0.001; Gam=0.072; Theta=40; Rho=1000; g=9.8;r1=0.00025;r2=0.0002;%�������
 k1=Rho*g*r1^2/(8*Eta)
 hc1=(2*Gam*cosd(Theta)/( Rho*g*r1))
 bizhi=hc1/k1
%  k2=Rho*g*r2^2/(8*Eta);
%  hc2=(2*Gam*cosd(Theta)/( Rho*g*r2))*1000;
%% ��ͼ
Y1=[0:0.000448999:0.0441];%�Զ��ĸ߶ȱ仯
t1=-1/0.0130966.*Y1-3.41.*log(1-Y1./0.0441);%��ϵ�ʱ��t�仯
Y10=[0:0.00000000448999:0.045021];%�Զ��ĸ߶ȱ仯
T10=-1/k1.*Y10-hc1/k1.*log(1-Y10/hc1);%ֻ���Թ�������Ӱ����ʽ��ʱ��t�ı仯


t=[0:0.1:20];
Y11=2*sqrt(Gam*cosd(Theta)/Rho/r1).*t;
Y12=sqrt(2)*sqrt(Gam*cosd(Theta)*r1/(4*Eta).*t+Gam*Rho*r1^3*cosd(Theta)/(Eta)^2/32.*(exp(-8*Eta/Rho/r1^2.*t)-1));%����������Ӱ��
Y13=sqrt(Gam*cosd(Theta)/2/Eta*r1.*t);%���������͹�������Ӱ��
x=-exp(-1-Rho^2*g^2*r1^3.*t/(16* Gam*Eta*cosd(Theta)));
W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
Y14=real(2*Gam*cosd(Theta)./( Rho*g*r1).*(1+W));%ֻ���Թ�������Ӱ��




% X2=[0:0.0761192:50.2]./1000;
% Y2=-0.04994.*X2-2.74.*log(1-X2./50.2);
% Y21=-1/k2.*X2-hc2/k2.*log(1-X2./hc2);

figure(1)
plot(R(:,1),R(:,2)/1000,'ko');%ʵ������
hold on
plot(t1,Y1,'k-','linewidth',2);%�������
hold on
plot(T10,Y10,'b-','linewidth',2);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(t,Y11,'y-','linewidth',2);%����������ճ����
hold on
plot(t,Y12,'r-','linewidth',2);%����������Ӱ��
hold on
plot(t,Y13,'ro','linewidth',2);%���������͹�������Ӱ��
hold on
plot(t,Y14,'bo','linewidth',1);%ֻ���Թ�������Ӱ����ʽ��
hold on
plot(tn,hn,'g*','linewidth',1);%��ֵ��
  axis([0, 2.5, 0, 0.1]);
% legend('ʵ������','�������','ֻ���Թ�������Ӱ����ʽ��','����������ճ����','����������Ӱ��','���������͹�������Ӱ��','ֻ���Թ�������Ӱ����ʽ��','��ֵ��','box','off');%'FontSize',12
legend('experimental data','fitting by model','implicit solution without inertia','analytical solution without gravity and viscous force',...
    'analytical solution without gravity','analytical solution without gravity and inertia','explicit solution without inertia','numerical solution','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);
% figure(1)
% plot(t,Y11,'r-','linewidth',2);%colorbar
% figure(2)
% plot(t,Y12,'k-','linewidth',2);%colorbar
% hold on
% plot(t,Y13,'ro','linewidth',2);%colorbar
% hold on
% plot(t,Y14,'b-','linewidth',2);%colorbar


% figure(2)
% plot(R(:,3),R(:,4),'ro');%colorbar
% hold on
% plot(Y2,X2,'r-','linewidth',2);%colorbar    
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
