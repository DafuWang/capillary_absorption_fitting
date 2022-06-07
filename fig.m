clf
clc
%clear all

%% 第一运行时，复制想要的数据到A和B里
%第一次去掉下面四行的注释，复制想要的数据后加上前两行的注释
%  He=1;
%  N=2;
% save te
% save he
% load te
% load he
%% 读取图片
% open('D:\毛细吸水\程序\论文中的图片程序\图片程序\h5-1.fig');
% lh = findall(gca, 'type', 'line');% 如果图中有多条曲线，lh为一个数组
% xc = get(lh, 'xdata');            % 取出x轴数据，xc是一个元胞数组
% yc = get(lh, 'ydata');            % 取出y轴数据，yc是一个元胞数组 %如果想取得第2条曲线的x，y坐标
% for i=5:-1:1
% figure(2)
% plot(xc{i},yc{i} ,'linewidth',3);
% hold on
% end
%% colormap的创建
r=[0.1;0.2;0.3;0.4;0.5]*1e-3/2;
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
%% 画图
for i=1:length(r)
    figure(1)
    plot(te(:,i),he(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
end
% %% 用于设置间隔数
% nn=100;
% [m,n]=size(h3);j=0;
% for i=1:nn:m
%     j=j+1;
%     h31(j,:)=h3(i,:);
%     T11(j)=T1(i);
% end
% %% 画图
% for i=1:length(r)
%     figure(1)
%     plot(T11,h31(:,i),'o','color',mycolor(i,:));%colorbar
%     hold on
% end
%%
% for i=1:length(r)
%     figure(1)
%     plot(N(:,1),N(:,i+1),'color',mycolor(i,:),'linewidth',3);%colorbar
%     hold on
% end
%% 设定图例，坐标
figure(1)
xlabel('t/s');ylabel('he/m');axis([0, 2.50, 0, 0.04]);
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
% legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
annotation(figure(1),'textbox',[0.5,0.27,0.46,0.05],...
    'String',{strcat('\theta =',num2str(THETA_W)),strcat('b=',num2str(b)),strcat('e=',num2str(e)),strcat('s=',num2str(s(5)))},...
    'LineWidth',1,'LineStyle','none','FitBoxToText','off');
