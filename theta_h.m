  %%���㱥�Ͷ���߶Ⱥ�ʱ��ı仯����  
    clc
    clear all
    tic
    clf
    %% ��������
    Eta=0.001; Gam=0.072; Theta=30; Rho=1000; g=9.8;Vw=18e-6;R=8.314;TK=293;NA=6.02e23;Aw=10.8e-20;%�������
    ri=0.01*1e-3;rn=0.001*1e-3;rf=0.5*1e-3;
    r=ri:rn:rf;
    hc=2*Gam*cosd(Theta)/( Rho*g)./r;%���۸߶�
    mu=(r(length(r))+r(1))/2;
    sigma=0.001;
    alph = normpdf(r,mu,sigma);%����̫�ֲ������ܶȺ�������׾��ֲ��ܶ���
    figure(1)
    plot(r,alph)
     alph=alph/sum(alph);
    figure(2)
    plot(r,alph) 
    xlabel('r/m');ylabel('\alpha')
    %% ����MIP����
% r_alph=xlsread('D:\CF60\Book2.xls');%��MIPȡ�׾��ֲ�����
% r_alph(:,1)=r_alph(:,1)/1e9;
% r=r_alph(:,1);%ëϸ�ܰ뾶��Χ
% alph=r_alph(:,2)/100;%ëϸ�ܿ׾��ֲ�
    %% ���㲻ͬ�뾶ëϸ�ܵ�ëϸˮ����ѧ����
    T=100;m=0.01;T1=[0:m:T]';%����ʱ��
    n=0;
    for t=0:m:T
        n=n+1;
        x=-exp(-1-Rho^2*g^2.*r.^3*t/(16* Gam*Eta*cosd(Theta)));
        W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
        h4(n,:)=real(2*Gam*cosd(Theta)./( Rho*g.*r).*(1+W));%ֻ���Թ�������Ӱ��
         t
    end

%% ���㱥�Ͷ���ʱ��͸߶ȵı仯
    hh=0:0.001:0.5;
    n=0;%ͳ�Ƽ���ʱ��
    j=0;%ͳ��������
    clf
    for tt=1:10*m:T %ʱ��ѭ��
       tt1=1:10*m:T;
%% colormap�Ĵ���
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
        for N=1:length(hh) %�߶�ѭ��
            for m1=1:length(r) %��ѭ��
%% ����deltaֵ
                if (h4(n,m1)>=hh(1,N)) %�ж��Ƿ���ڲο��߶�
                        delta(m1)=1;
                else  
                        delta(m1)=0;
                end 
            end
           THTA(n,N)= sum(delta.*alph);
        end
      %% ���һ��ʱ����г�ͼ      
        if mod(n,10)==0  
            j=j+1
            plot(hh,THTA(n,:),'color',mycolor(n,:))
            xlabel('h/m');ylabel('\theta');legend(strcat('t=',num2str(tt)));%strcat �����ַ�            
            hold on
%             colorbar
            set(gcf,'color','w')
            axis ([0 0.12 0 1]) 
            pause(0.02)
     %% ���Gif
            F=getframe(gcf);%��ȡ����ͼ��
            I=frame2im(F);
            [I,map]=rgb2ind(I,256);
            if j == 1
                imwrite(I,map,'theta_h.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
            else
                imwrite(I,map,'theta_h.gif','WriteMode','append','DelayTime',0.2);
            end       
        end
    end 
%% ���ı����������
    hold on
    strings={strcat( 'r_i=',num2str(ri),'��r_n=',num2str(rn),'��r_f=',num2str(rf));strcat( '\mu=',num2str((r(length(r))+r(1))/2));strcat('\sigma=',num2str(sigma))};
    annotation('textbox',[0.5,0.5,0.4,0.15],'LineStyle','-','LineWidth',1,'String',strings);
    toc




