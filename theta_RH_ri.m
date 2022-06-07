clear all
%% ��ʼ�׾��Ի�����ˮ���������ߵ�Ӱ��
    Eta=0.001; Gam=0.072; Theta=30; Rho=1000; 
    g=9.8;Vw=18e-6;R=8.314;TK=293;NA=6.02e23;Aw=10.8e-20;%������� 
   ri_i=0.1e-9;ri_n=0.4e-9;ri_f=10e-9;
   ri1=ri_i:ri_n:ri_f;
%% colormap�Ĵ���
nrgb=length(ri1); %length(ri1)�����ж���������
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
%%  ����ri��Ӱ�� 
    m=0;
    clf
   for ri=ri_i:ri_n:ri_f
    clear alph1
    m=m+1;
    rn=0.001*1e-9;rf=20*1e-9;%��׾����ٽ����ֵ��С�׾�����Сʪ��
    r=ri:rn:rf;
%%  ѡ�񷽲�  
    n=0
   sigma1=0.1e-9:0.1e-9:0.1e-9; 
   for sigma=0.1e-9:0.1e-9:0.1e-9
       n=n+1;
       alph = normrnd((ri+rf)/2,sigma,length(r),1);%����̫�ֲ������ܶȺ��������׾��ֲ�
       alph1(:,n)=alph;
       alph1(:,n)=abs(alph1(:,n))/sum(abs(alph1(:,n)));
   end     
%%    
%     theta1=0;    
    for i=2:length(r)
        alph1(i,:)=alph1(i-1,:)+alph1(i,:);%�������ۼ�
    end  
    theta1=alph1;

 %% 
    RH=exp(-Vw*2*Gam*cosd(Theta)/(R*TK)./r);%���ʼ�׾������仯
    figure(1)
    hold on
    plot(RH,theta1(:,1),'color',mycolor(m,:))
    axis([0 1 0 1])
    set(gcf,'color','w') 
%   colorbar
    xlabel('RH/%');ylabel('\theta') ;legend(strcat('\sigma =',num2str(sigma1(n)),';ri=',num2str(ri),';rf=',num2str(rf)))
    pause(0.2)
 %% ���Gif
    F=getframe(gcf);%��ȡ����ͼ��
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if m == 1
        imwrite(I,map,'theta_RH_ri.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'theta_RH_ri.gif','gif','WriteMode','append','DelayTime',0.2);
    end  
%     end
 %%    
 
% a=[RH' theta1];
% save (strcat('C:\Users\wangdafu\Desktop\Capillary flow of water in concrete exposed to unsaturated soil\ri\ri=',num2str(ri),'.txt'), '-ascii' ,'a' )
end 
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.08,0.1,0.91,0.89]);   
    
    
    
    
    
    
    
   
    
