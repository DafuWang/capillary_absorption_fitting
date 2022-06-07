% % 吸水量和饱和度及吸水时间的关系
clear all
clc
clf
    Eta=0.001; Gam=0.072; Theta=30; Rho=1000; phi=0.2;
    g=9.8;Vw=18e-6;R=8.314;TK=293;NA=6.02e23;Aw=10.8e-20;%计算参数 
    ri=0.1*1e-9;rn=0.001*1e-9;rf=2e-9;%大孔决定临界进气值，小孔决定最小湿度
    r=ri:rn:rf;
%%  选择孔径分布  
    n=0;
   sigma1=0.1e-9:0.1e-9:0.1e-9; 
   for sigma=0.1e-9:0.1e-9:0.1e-9
       n=n+1;
       alph = normrnd((ri+rf)/2,sigma,length(r),1);%用正太分布概率密度函数表征孔径分布
       alph1(:,n)=alph;
       alph1(:,n)=abs(alph1(:,n))/sum(abs(alph1(:,n)));       
   end  
%% 计算不同半径毛细管的毛细水动力学过程    
    T=100;m=0.05;T1=[0:m:T]';%计算时间
    n=0;
    for t=0:m:T
        n=n+1;
        x=-exp(-1-Rho^2*g^2.*r.^3*t/(16* Gam*Eta*cosd(Theta)));
        W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
        h4(n,:)=real(2*Gam*cosd(Theta)./( Rho*g.*r).*(1+W));%只忽略惯性力的影响
        t
    end
%% colormap的创建
nr=150;%修改输出饱和度间隔
nrgb=length(1:nr:length(r));     
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
    colorbar
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
    
    
    
    
    
    
    
   
    
