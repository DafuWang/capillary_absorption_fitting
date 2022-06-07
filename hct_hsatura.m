clc
    k1=7.96*10^(-8);hc1=6.03*10^(-3);%重力
    k2=2.488*10^(-7);hc2=3.6*10^(-2);%CT
    t=[0:90000];
    x=-exp(-1-k1/hc1*t);
    W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
    h41=real(hc1*(1+W));%只忽略惯性力的影响
    
    x=-exp(-1-k2/hc2*t);
    W=-1+sqrt(2+2*exp(1).*x)./(1+4.13501*sqrt(2+2*exp(1).*x)./(12.7036+sqrt(2+2*exp(1).*x)));
    h42=real(hc2*(1+W));%只忽略惯性力的影响
    h42_h41=h41./h42;
    figure(2)
    plot(t,h41,'k-'); hold on 
    plot(t,h42,'r-');
    
    figure(3)
    plot(t,h42_h41)
%     axis([0,90000,0.18,0.3])
    xlabel('t/s');ylabel('I/h');
    set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.092,0.1,0.90,0.89]);

