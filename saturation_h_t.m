clc
% RM=1;FM=1;
A=[1.256*10^7,1.834*10^7,7.285*10^7,3.033*10^8,1.486*10^9];
C=[165.542,222.767,320.656,532.559,854.640];
B=[7.589*10^4,8.234*10^4,2.271*10^5,5.697*10^5,1.735*10^6];
% satuRea_I_t=RM;satuFit_I_t=FM;
load satuRea_I_t
load satuFit_I_t
satur=[0,20,40,60,80]';
k_matrix=[1./A']
h_matrix=[1./C']
hk_matrix=[1./B'];

nrgb=5;
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
%%
set(0,'defaultfigurecolor','w');%设定背景颜色为白色
figure(1)
for i=1:5
 fm(i)=plot(FM(:,2*i),FM(:,2*i-1),'color',mycolor(i,:),'linewidth',1); hold on 
 rm(i)=plot(RM(:,2*i),RM(:,2*i-1),'o','color',mycolor(i,:),'linewidth',1); hold on
end
xlabel('t/s');ylabel('I/m');axis([0, 2*10^5, 0, 0.0065]);
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.058,0.1,0.91,0.85]);
for i=1:5
     axesNew(i) = axes('position',get(gca,'position'),'visible','off');% 绘制第二个图例时指定在新建的坐标系中
     legend(axesNew(i),[rm(i),fm(i)],{strcat('\theta=',num2str(satur(i)),'%'),''},...%roundn(h_matrix(i))
     'FontSize',9,'NumColumns',2, 'FontName','Arial','box','off' , 'Location',[0.05, -0.15*i+1, 0.50, 0.077]);
     set(text,'string','$t=-\frac{I}{6.73\times10^{-10}}-5.76\times10^{-7}ln(1-\frac{I}{1.17\times10^{-3}})$','Interpreter','latex',...
    'position',[20.4, 141.35, 306.81],'FontSize',10)
end















