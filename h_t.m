clc
clf
% clear all
% NN=1;
tic
Eta=0.001; Gam=0.072; Theta=40; Rho=1000; g=9.8;%计算阐述
r=[0.1;0.2;0.3;0.4;0.5]*1e-3/2;
hc=2*Gam*cosd(Theta)/( Rho*g)./r;%理论高度
KK=Rho*g*r.^2./(8*Eta);
T=40;m=0.01;T1=[0:m:T]';%计算时间
n=0;
for t=0:m:T
    n=n+1;
    h1(n,:)=2*sqrt(Gam*cosd(Theta)/Rho./r)*t;%惯性力和表面张力占主导
    h2(n,:)=sqrt(2)*sqrt(Gam*cosd(Theta).*r/(4*Eta)*t+Gam*Rho.*r.^3*cosd(Theta)/(Eta)^2/32.*(exp(-8*Eta/Rho./r.^2*t)-1));%忽略重力的影响
    h3(n,:)=sqrt(Gam*cosd(Theta)/2/Eta*r*t);%忽略重力和惯性力的影响
    x=-exp(-1-Rho^2*g^2.*r.^3*t/(16* Gam*Eta*cosd(Theta)));
    W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
    h4(n,:)=real(2*Gam*cosd(Theta)./( Rho*g.*r).*(1+W));%只忽略惯性力的影响    
    t;
end
%% 隐式解
for i=1:5    
tt1(:,i)=-1/KK(i).*h4(:,i)-hc(i)/KK(i).*log(1-h4(:,i)./hc(i));%拟合的时间t变化
end
%% 考虑蒸发作用
THETA_W=0.89;b=0.01;s=sqrt(Gam*cosd(Theta)/(2*Eta).*r);e=0.001;%修改b和e得到不同的蒸发的影响
ALPHA=2*e*THETA_W./(b*s.^2);
ALPHA=(ALPHA.*hc)';
BETA=sqrt(1+4*ALPHA);
hcv=hc'.*(-1+sqrt(1+4*ALPHA))./(4*ALPHA);
H1=h4./hc';
TT=-log(abs(H1.^2.*ALPHA+H1-1)).*1./(2*ALPHA)-log(abs((2*H1.*ALPHA+1+BETA).*(1-BETA)./((2*H1.*ALPHA+1-BETA).*(1+BETA)))).*1./(2*ALPHA.*BETA);
te1=THETA_W^2*TT.*hc'.^2./s'.^2;
[y_col, ind_row]=max(te1);
H=[0:0.0001:1]'*[H1(ind_row(1),1) H1(ind_row(2),2) H1(ind_row(3),3) H1(ind_row(4),4) H1(ind_row(5),5)];
TT=-log(abs(H.^2.*ALPHA+H-1)).*1./(2*ALPHA)-log(abs((2*H.*ALPHA+1+BETA).*(1-BETA)./((2*H.*ALPHA+1-BETA).*(1+BETA)))).*1./(2*ALPHA.*BETA);
te=THETA_W^2*TT.*hc'.^2./s'.^2;
he=H.*hc';
%% colormap的创建
nrgb=length(r);
for i=nrgb:10*nrgb
    rgb=64/i;
    mycolormap_r=interp1([1 8 24 40 56 64],[0 0 0 1 1  1 ],1:rgb:64);
    mycolormap_g=interp1([1 8 24 40 56 64],[0 0 1 1 0  0  ],1:rgb:64);
    mycolormap_b=interp1([1 8 24 40 56 64],[0 1 1 0 0  0  ],1:rgb:64);
    if length(mycolormap_r)>=nrgb
        break
    end
end
mycolor=[mycolormap_r',mycolormap_g',mycolormap_b'];
colormap(mycolor);
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
%%
for i=1:length(r)
    figure(1)
    plot(T1,h1(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
    figure(2)
    plot(T1,h2(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
    figure(3)
    plot(T1,h3(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
    figure(4)
    plot(T1,h4(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
    figure(5)
    plot(te(:,i),he(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
    figure(6)
    plot(tt1(:,i),h4(:,i),'o');%colorbar
    plot(T1,h4(:,i),'o');%colorbar
    hold on
    % pause(0.1)
end

figure(1)
xlabel('t/s');ylabel('h1/m');axis([0, 20, 0, 50]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);%第1，2个数图框左下角离屏幕左下角的大小，第3，4个图框的长和高，单位是像素
set(gca,'position',[0.07,0.1,0.91,0.88]);%第1，2个数越小图距离图框左、下越小，第3，4个数越小图距离图框右、上越大

figure(2)
xlabel('t/s');ylabel('h2/m');axis([0, 20, 0, 0.4]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);

figure(3)
xlabel('t/s');ylabel('h3/m');axis([0, 20, 0, 0.4]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);

figure(4)
xlabel('t/s');ylabel('h4/m');axis([0, 20, 0, 0.14]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);

figure(5)
xlabel('t/s');ylabel('he/m');axis([0, 2.50, 0, 0.04]);
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
annotation(figure(5),'textbox',[0.5,0.27,0.46,0.05],...
    'String',{strcat('\theta =',num2str(THETA_W)),strcat('b=',num2str(b)),strcat('e=',num2str(e)),strcat('s=',num2str(s(5)))},...
    'LineWidth',1,'LineStyle','none','FitBoxToText','off');

figure(6)
xlabel('t/s');ylabel('h4/m');axis([0, 20, 0, 0.14]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);

