clear
clc
clf
file_address='C:\Users\14422\Desktop\物联网\Arduino程序\电导率\EC\';
filename=["L1-2","L3-4","L5-6","L7-8","L9-10"];
now=fix(clock);DATA1=now(1:5);
DATA=strcat(num2str(now(1)),'_',num2str(now(2)),'_',num2str(now(3)),'_',num2str(now(4)),'_',num2str(now(5)));
for i=1:5
 open(strcat(file_address,filename(i),'.fig'));
 obj= get(gca, 'children');% 如果图中有多条曲线，lh为一个数组
 xc = get(obj, 'xdata');% 取出x轴数据，xc是一个元胞数组 
 yc = get(obj, 'ydata');% 取出y轴数据，yc是一个元胞数组 %如果想取得第2条曲线的x，y坐标
xxc=xc{1};yyc=yc{1};
figure(1)
plot(xxc,yyc)
excel_name=strcat(file_address,'./EC_data',DATA);
write_sheet='sheet1';
name1={char(filename(i))};%char将str转化成char,将双引号转化为单引号
xlswrite(excel_name,name1,write_sheet,strcat(char(64+2*i-1),'1'));
xlswrite(excel_name,xxc',write_sheet,strcat(char(64+2*i-1),'2'));
xlswrite(excel_name,yyc',write_sheet,strcat(char(64+2*i),'2'));
end
% open('C:\Users\14422\Desktop\物联网\Arduino程序\电导率\EC\W5-6.fig');
% 
% obj = get(gca, 'children');% 如果图中有多条曲线，lh为一个数组
% 
clock

% % xy1=[xc{347}',yc{347}'];
% % xy2=[xc{297}',yc{297}'];
% % xy3=[xc{219}',yc{219}'];
% % xy1=[xc{1}',yc{1}'];
% xy2=[xc{1}',yc{1}'];
% 
% % xy4=[xc{1}',yc{1}'];
% 
% figure(3)
% plot(xy1(:,1),xy1(:,2),xy2(:,1),xy2(:,2),xy3(:,1),xy3(:,2),xy4(:,1),xy4(:,2));
% delete(obj);%删除某一条曲线
% satu_experi=1;
% save satu_experi
%% 画CT和称重数据图












% % delete(obj(1));%删除某一条曲线
% % delete(obj(3));%删除某一条曲线
% % save satu_CT
% yyaxis left;
% % p1=plot(satu_CT(1:13,2),satu_CT(1:13,1),'r*','linewidth',1);
% % p2=plot(satu_CT(:,4),satu_CT(:,3),'r-','linewidth',1);
% ylim([0 0.026]);ylabel('I or h/m')
% 
% set(text,'string','$t=-\frac{I}{7.96\times10^{-8}}-7.59\times10^{4}ln(1-\frac{I}{6.03\times10^{-3}})$','Interpreter','latex',...
%      'Position',[20554 0.012 0],'FontSize',10);
% 
% yyaxis right;
% plot(t,h42_h41,'-','linewidth',2);
% xlabel('t/s');ylabel('I/h');
% % ylim([0.025 0.06]);
% xlim([0 90000]);
% set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.80,0.89]);





%%

% plot(satu_experi(:,1),satu_experi(:,2) ,'ko-','linewidth',1);hold on
% plot(satu_experi(:,1),satu_experi(:,3) ,'r*-','linewidth',1);hold on
% plot(satu_experi(:,1),satu_experi(:,4) ,'gs-','linewidth',1);hold on
% plot(satu_experi(:,1),satu_experi(:,5) ,'bv-','linewidth',1);hold on
% plot(satu_experi(:,1),satu_experi(:,6) ,'m>-','linewidth',1);hold on
% axis([0,2.75*10^6,0,2.5*10^(-3)]);ylabel('I/m');xlabel('t/s');
% set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.08,0.1,0.91,0.85]);
% legend('r1','r2','r3','r4','r5','box','off')
% annotation('textbox',...
%     [0.0601190476190476 0.888682539682541 0.0684523809523809 0.0650793650793651],...
%     'String',{'(a)'},...
%     'LineStyle','none');




% % xlabel('t/s');ylabel('he/m');axis([0, 20, 0, 0.14]);
% set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);
% legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
% annotation(figure(5),'textbox',[0.5,0.27,0.46,0.05],...
%     'String',{strcat('\theta =',num2str(THETA_W)),strcat('b=',num2str(b)),strcat('e=',num2str(e)),strcat('s=',num2str(s(5)))},...
%     'LineWidth',1,'LineStyle','none','FitBoxToText','off');