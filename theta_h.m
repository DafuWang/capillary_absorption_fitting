  %%计算饱和度随高度和时间的变化程序  
    clc
    clear all
    tic
    clf
    %% 基本参数
    Eta=0.001; Gam=0.072; Theta=30; Rho=1000; g=9.8;Vw=18e-6;R=8.314;TK=293;NA=6.02e23;Aw=10.8e-20;%计算参数
    ri=0.01*1e-3;rn=0.001*1e-3;rf=0.5*1e-3;
    r=ri:rn:rf;
    hc=2*Gam*cosd(Theta)/( Rho*g)./r;%理论高度
    mu=(r(length(r))+r(1))/2;
    sigma=0.001;
    alph = normpdf(r,mu,sigma);%用正太分布概率密度函数计算孔径分布密度是
    figure(1)
    plot(r,alph)
     alph=alph/sum(alph);
    figure(2)
    plot(r,alph) 
    xlabel('r/m');ylabel('\alpha')
    %% 利用MIP计算
% r_alph=xlsread('D:\CF60\Book2.xls');%读MIP取孔径分布数据
% r_alph(:,1)=r_alph(:,1)/1e9;
% r=r_alph(:,1);%毛细管半径范围
% alph=r_alph(:,2)/100;%毛细管孔径分布
    %% 计算不同半径毛细管的毛细水动力学过程
    T=100;m=0.01;T1=[0:m:T]';%计算时间
    n=0;
    for t=0:m:T
        n=n+1;
        x=-exp(-1-Rho^2*g^2.*r.^3*t/(16* Gam*Eta*cosd(Theta)));
        W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
        h4(n,:)=real(2*Gam*cosd(Theta)./( Rho*g.*r).*(1+W));%只忽略惯性力的影响
         t
    end

%% 计算饱和度随时间和高度的变化
    hh=0:0.001:0.5;
    n=0;%统计计算时间
    j=0;%统计线条数
    clf
    for tt=1:10*m:T %时间循环
       tt1=1:10*m:T;
%% colormap的创建
nrgb=length(tt1);
for i=nrgb:10*nrgb
    rgb=64/i;
    mycolormap_r=interp1([1 8 24 40 56 64],[0 0 0 1 1 0.5 ],1:rgb:64);
    mycolormap_g=interp1([1 8 24 40 56 64],[0 0 1 1 0  0  ],1:rgb:64);
    mycolormap_b=interp1([1 8 24 40 56 64],[0 1 1 0 0  0  ],1:rgb:64);
    if length(mycolormap_r)>=nrgb
        break
    end
end
mycolor=[mycolormap_r',mycolormap_g',mycolormap_b']; 
colormap(mycolor);
%%
        n=n+1;
        for N=1:length(hh) %高度循环
            for m1=1:length(r) %孔循环
%% 计算delta值
                if (h4(n,m1)>=hh(1,N)) %判断是否大于参考高度
                        delta(m1)=1;
                else  
                        delta(m1)=0;
                end 
            end
           THTA(n,N)= sum(delta.*alph);
        end
      %% 间隔一定时间进行出图      
        if mod(n,10)==0  
            j=j+1
            plot(hh,THTA(n,:),'color',mycolor(n,:))
            xlabel('h/m');ylabel('\theta');legend(strcat('t=',num2str(tt)));%strcat 链接字符            
            hold on
%             colorbar
            set(gcf,'color','w')
            axis ([0 0.12 0 1]) 
            pause(0.02)
     %% 输出Gif
            F=getframe(gcf);%获取整个图窗
            I=frame2im(F);
            [I,map]=rgb2ind(I,256);
            if j == 1
                imwrite(I,map,'theta_h.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
            else
                imwrite(I,map,'theta_h.gif','WriteMode','append','DelayTime',0.2);
            end       
        end
    end 
%% 画文本框并添加内容
    hold on
    strings={strcat( 'r_i=',num2str(ri),'；r_n=',num2str(rn),'；r_f=',num2str(rf));strcat( '\mu=',num2str((r(length(r))+r(1))/2));strcat('\sigma=',num2str(sigma))};
    annotation('textbox',[0.5,0.5,0.4,0.15],'LineStyle','-','LineWidth',1,'String',strings);
    toc




