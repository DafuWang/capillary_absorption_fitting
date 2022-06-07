
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
    sigma=0.0001;
    alph = normpdf(r,mu,sigma);%����̫�ֲ������ܶȺ�������׾��ֲ��ܶ���
    figure(1)
%   plot(r,alph)
    alph=alph/sum(alph);
    figure(1)
    plot(r,alph) 
    xlabel('r/m');ylabel('\alpha')
    set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.07,0.1,0.92,0.89]);