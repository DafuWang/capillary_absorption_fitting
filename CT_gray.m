% %
% % %%������Ƭ��Ĳ�ͬʱ�����ˮCT���ݴ�������ˮ���ݴ���E���½���CT�����£��ļ���Ÿ�����ˮʱ���1��ʼ������
% % %�и���ļ���1����X����2����Y����3����Z����
% clc
% clf
% clear all
% tic
% %% ͼƬ��ȡ
% B=[];
% n=0;
% N=15;%һ���ж��ٲ����˶���ʱ��
% %% ����ֱ����ȷ���иΧ��ɾ����ˮ�����ĵط�����С������
% xx1=400;xx2=600;
% yy1=400;yy2=600;
% zz1=50;zz2=350;
% %% ����Ԫ������
% NumOfExp = N;
% M = cell(1,NumOfExp);
% MB = cell(1,NumOfExp);
% %% ��ȡ��ͬʱ��ε�CT����
% nn=0;
% for i=zz1:zz2 %��ȡ��Ƭ��
%     n=n+1;
%     i
% for j=1:N
%    nn=1000*j+i;
%    M{j}  = imread(strcat('G:\������������CT\����Ȼ����Һ��ˮ\������VG\',num2str(j),'\',num2str(nn),'.bmp'));%��ȡ����
% end
% for nn=1:N
%    MB{nn}(:,:,n)=M{nn}(xx1:xx2,yy1:yy2);% ��Ԫ��M�е�nn����Ԫ����ά���鸳ֵ��Ԫ��MB�е�nn����Ԫ����ά�����ǰ��ά
% end
% end
% %% ���ݵ����
% for m=1:N
%     m
%     mkdir('G:\CT1\', num2str(m))%����CT�ĸ���
%     MMB(m)=max(max(M{m}));
%     for i=1:3
%         mkdir(strcat('G:\CT1\',num2str(m),'\'),num2str(i))%�ļ������ٽ�����������ļ���
%         if i==1
%         %% ���X����
%             for j = 1:length(xx1:xx2)
%                 BB =MB{m}(j,:,:);
%                 BB =rot90(squeeze(BB));
%                 imwrite(BB,strcat('G:\CT1\',num2str(m),'\',num2str(i),'\','Picture y_z',num2str(i),'_',num2str(j),'.bmp'));
%             end
%         elseif i==2
%          %% ���Y����
%             for j = 1:length(yy1:yy2)
%                 BB =MB{m}(:,j,:);
%                 BB =rot90(squeeze(BB),2);%��ά����ͷ�����ת
%                 imwrite(BB',strcat('G:\CT1\',num2str(m),'\',num2str(i),'\','Picture x_z',num2str(i),'_',num2str(j),'.bmp'));
%             end
%         else
%           %% ���Z����
%             for j = 1:length(zz1:zz2)
%                 BB = MB{m}(:,:,j);
%                 BB =rot90(flipud(squeeze(BB)));%��ά����ͷ�����ת
%                 imwrite(BB,strcat('G:\CT1\',num2str(m),'\',num2str(i),'\','Picture x_y',num2str(i),'_',num2str(j),'.bmp'));
%             end
%         end
%     end
% end
% toc %��γ�����ѵ�೤ʱ��
% % colormap�Ĵ���
% nrgb=N;%���������������
% for j=nrgb:10*nrgb
%    rgb=64/j;
%    mycolormap_r=interp1([1 8 24 40 56 64],[0 0 0 1 1  1 ],1:rgb:64);
%    mycolormap_g=interp1([1 8 24 40 56 64],[0 0 1 1 0  0  ],1:rgb:64);
%    mycolormap_b=interp1([1 8 24 40 56 64],[0 1 1 0 0  0  ],1:rgb:64);
% if length(mycolormap_r)>=nrgb
%    break
% end
% end
% mycolor=[mycolormap_r',mycolormap_g',mycolormap_b'];
% colormap(mycolor);
% %%
% cc=1;
T=[0 25 50 75 100 125 150 175 235 355 530 710 890 1070 1250];
% figure(1)
nnn=300;
for i=1:N
    A(:,i) = cast(MB{i}(80,40,:),'like',1);%ȡiʱ���������xy(1,1)λ�ô�z����ĻҶ�ֵ,��ת��Ϊ����
end
for i=1:N
    A(:,i)=A(:,i)+A(nnn,15)-A(nnn,i);
    plot(A(:,i)+15*50/1250*T(i),(1:301)','color',mycolor(i,:),'LineWidth',2);hold on%����ض��ߵĻҶ�ֵ
    % ���Gif
    F=getframe(gcf);%��ȡ����ͼ��
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    imwrite(I,map,strcat('I_t',num2str(i),'.bmp'));%���������άͼ
    if i == 1
        imwrite(I,map,'I_t1.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'I_t1.gif','gif','WriteMode','append','DelayTime',0.2);
    end
    
end
set(gcf,'color','w')%�趨����
ylabel('height/65\mum');axis([80,920,0,300]);
set(gcf,'position',[100,100,1000,500]);set(gca,'position',[0.05,0.04,0.94,0.95]);
set(gca,'xtick',[]);
for i=1:15
     annotation(figure(1),'textbox',[0.901/1250*T(i) 0.008 0.068 0.035],'String',{strcat(num2str(T(i)),'min')},...
    'LineStyle','none', 'FitBoxToText','off');
end

% figure(1)
% for i=1:N
%     A(:,i) = cast(MB{i}(80,40,:),'like',1);%ȡiʱ���������xy(1,1)λ�ô�z����ĻҶ�ֵ,��ת��Ϊ����
% end
% figure(1)
% set(gcf,'color','w')%�趨����
% for i=13:13
%     A(:,i)=A(:,i)+A(nnn,15)-A(nnn,i);
%     plot((1:301)',A(:,i),'k-','LineWidth',1);hold on%����ض��ߵĻҶ�ֵ
%     % ���Gif
%     F=getframe(gcf);%��ȡ����ͼ��
%     I=frame2im(F);
%     [I,map]=rgb2ind(I,256);
%     imwrite(I,map,strcat('I_t',num2str(i),'.bmp'));%���������άͼ    
% end
% ylabel('gray');xlabel('height/65\mum');
% axis([ 0, 300,0, 255]);
% set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.088,0.1,0.89,0.88]);
% annotation(figure(1),'line',[0.631547619047619 0.0875],[0.687 0.687],'Color',[1 0 0],'LineWidth',1,'LineStyle','--');


