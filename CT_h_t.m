clc
% CTh_t=1;
load CTh_t

set(0,'defaultfigurecolor','w');%设定背景颜色为白色
figure(1)

rh_t=plot(CTh_t(:,2),CTh_t(:,1),'ko','linewidth',1); hold on
fih_t=plot(CTh_t(:,6),CTh_t(:,5),'k-','linewidth',1); hold on
fsh_t=plot(CTh_t(:,4),CTh_t(:,3),'k-','linewidth',3); hold on
xlabel('t/s');ylabel('h/m');axis([0, 8*10^4, 0, 0.0275]);
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.88,0.89]);


axesNew = axes('position',get(gca,'position'),'visible','off');% 绘制第二个图例时指定在新建的坐标系中
legend(axesNew,[rh_t,fih_t,fsh_t],{'','',''}, 'FontSize',9,'NumColumns',1, 'FontName','Arial','box','off' , 'Location',[0.239 0.129 0.15625 0.23]);
set(text,'string','$t=-\frac{h}{2.488\times10^{-7}}-1.47\times10^{5}ln(1-\frac{h}{3.60\times10^{-2}})$','Interpreter','latex',...
    'position',[0.30 0.175 0.076],'FontSize',10)
set(text,'string','$h={9.926\times10^{-5}}t$','Interpreter','latex',...
    'position',[0.30 0.086 0.076],'FontSize',10)
annotation(figure(1),'textbox',[0.37 0.307 0.22 0.065],'String',{'experimental data'},'LineStyle','none', 'FitBoxToText','off');
















