
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
    sigma=0.0001;
    alph = normpdf(r,mu,sigma);%用正太分布概率密度函数计算孔径分布密度是
    figure(1)
%   plot(r,alph)
    alph=alph/sum(alph);
    figure(1)
    plot(r,alph) 
    xlabel('r/m');ylabel('\alpha')
    set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.07,0.1,0.92,0.89]);