clf
clc
%clear all

%% ��һ����ʱ��������Ҫ�����ݵ�A��B��
%��һ��ȥ���������е�ע�ͣ�������Ҫ�����ݺ����ǰ���е�ע��
%  He=1;
%  N=2;
% save te
% save he
% load te
% load he
%% ��ȡͼƬ
% open('D:\ëϸ��ˮ\����\�����е�ͼƬ����\ͼƬ����\h5-1.fig');
% lh = findall(gca, 'type', 'line');% ���ͼ���ж������ߣ�lhΪһ������
% xc = get(lh, 'xdata');            % ȡ��x�����ݣ�xc��һ��Ԫ������
% yc = get(lh, 'ydata');            % ȡ��y�����ݣ�yc��һ��Ԫ������ %�����ȡ�õ�2�����ߵ�x��y����
% for i=5:-1:1
% figure(2)
% plot(xc{i},yc{i} ,'linewidth',3);
% hold on
% end
%% colormap�Ĵ���
r=[0.1;0.2;0.3;0.4;0.5]*1e-3/2;
nrgb=length(r);
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
set(0,'defaultfigurecolor','w');%�趨������ɫΪ��ɫ
%% ��ͼ
for i=1:length(r)
    figure(1)
    plot(te(:,i),he(:,i),'color',mycolor(i,:),'linewidth',3);%colorbar
    hold on
end
% %% �������ü����
% nn=100;
% [m,n]=size(h3);j=0;
% for i=1:nn:m
%     j=j+1;
%     h31(j,:)=h3(i,:);
%     T11(j)=T1(i);
% end
% %% ��ͼ
% for i=1:length(r)
%     figure(1)
%     plot(T11,h31(:,i),'o','color',mycolor(i,:));%colorbar
%     hold on
% end
%%
% for i=1:length(r)
%     figure(1)
%     plot(N(:,1),N(:,i+1),'color',mycolor(i,:),'linewidth',3);%colorbar
%     hold on
% end
%% �趨ͼ��������
figure(1)
xlabel('t/s');ylabel('he/m');axis([0, 2.50, 0, 0.04]);
set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.11,0.1,0.87,0.88]);
legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
% legend('r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','r=0.05mm','r=0.1mm','r=0.15mm','r=0.2mm','r=0.25mm','location','SouthEast','box','off');%'FontSize',12
annotation(figure(1),'textbox',[0.5,0.27,0.46,0.05],...
    'String',{strcat('\theta =',num2str(THETA_W)),strcat('b=',num2str(b)),strcat('e=',num2str(e)),strcat('s=',num2str(s(5)))},...
    'LineWidth',1,'LineStyle','none','FitBoxToText','off');
