clc
clf
%  h41=h4;
figure(1)
plot(tt1(:,1),h41(:,1),'k-','linewidth',1);hold on
plot(tt1(:,2),h41(:,2),'b-','linewidth',1);hold on
plot(tt1(:,3),h41(:,3),'g-','linewidth',1);hold on
plot(tt1(:,4),h41(:,4),'y-','linewidth',1);hold on
plot(tt1(:,5),h41(:,5),'r-','linewidth',1);hold on

nn=130;
n=[1:nn:length(T1)];%用于控制跳动输出，130为跳动的个数
plot(T1(n),h4(n,1),'ko');hold on
plot(T1(n),h4(n,2),'bo');hold on
plot(T1(n),h4(n,3),'go');hold on
plot(T1(n),h4(n,4),'yo');hold on
plot(T1(n),h4(n,5),'ro');hold on

xlabel('t/s');ylabel('h/m');axis([0, 20, 0, 0.14]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.09,0.1,0.89,0.88]);