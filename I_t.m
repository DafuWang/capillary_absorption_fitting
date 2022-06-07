% % 吸水量和饱和度及吸水时间的关系
clear all
clc
clf
    Eta=0.001; Gam=0.072; Theta=30; Rho=1000; phi=0.2;
    g=9.8;Vw=18e-6;R=8.314;TK=293;NA=6.02e23;Aw=10.8e-20;%计算参数 
    ri=0.1*1e-4;rn=0.001*1e-4;rf=5e-4;%大孔决定临界进气值，小孔决定最小湿度
    r=ri:rn:rf;
%%  选择孔径分布
    mu=(r(length(r))+r(1))/2;
    sigma=0.001;%论文中需要修改的地方
    alph = normpdf(r,mu,sigma);
    alph1(:,1)=alph/sum(alph);
%% 计算不同半径毛细管的毛细水动力学过程    
    T=5;m=0.01;T1=[0:m:T]';%计算时间
    n=0;
    for t=0:m:T
        n=n+1;
        x=-exp(-1-Rho^2*g^2.*r.^3*t/(16* Gam*Eta*cosd(Theta)));
        W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
        h4(n,:)=real(2*Gam*cosd(Theta)./( Rho*g.*r).*(1+W));%只忽略惯性力的影响
        t
    end
%% colormap的创建
nr=500;%修改输出饱和度间隔
nrgb=length(1:nr:length(r)); %输出线条间隔数    
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
%%  计算不同饱和度下，吸水高度与时间的关系
nn=0; 
  for i=1:nr:length(r) 
        n=0;  
        nn=nn+1;
        theta1=sum(alph1(1:i,:))-alph1(1);        
 for tt=0:m:T 
    n=n+1;
    alph2=alph1';
    II(i,n)=phi*sum(alph2(:,i:end).*h4(n,i:end)); 
 end
   %% 出图
    hold on     
    plot(T1,II(i,:),'color',mycolor(nn,:),'LineWidth',2)
    set(gcf,'color','w')%设定背景
%     colorbar
    xlabel('t/s');ylabel('I/m') ;
    legend(strcat('\theta =',num2str(theta1),';ri=',num2str(ri),';rf=',num2str(rf)))
 %% 输出Gif
    F=getframe(gcf);%获取整个图窗
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if i == 1
        imwrite(I,map,'I_t.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'I_t.gif','gif','WriteMode','append','DelayTime',0.2);
    end
  end
  %% 画文本框并添加内容
%     hold on
%     strings={strcat( 'r_i=',num2str(ri),'；r_n=',num2str(rn),'；r_f=',num2str(rf));strcat( '\mu=',num2str((r(length(r))+r(1))/2));strcat('\sigma=',num2str(sigma))};
%     annotation('textbox',[0.5,0.5,0.4,0.15],'LineStyle','-','LineWidth',1,'String',strings);
    toc
    annotation(figure(1),'textbox',[0.147619047619048 0.773015873015874 0.4 0.15],...
    'String',{'r_i=10^-^5m；r_n=0.01\times10^-^5m；r_f=50\times10^-^5m','\mu=2.55\times10^-^4','\sigma=10^-^3'},...
    'LineWidth',1,...
    'LineStyle','none',...
    'FitBoxToText','off');
    set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.1,0.1,0.89,0.89]);
    
    
    
    
    
    
   
    
