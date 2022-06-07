% %
% % %%根据切片后的不同时间段吸水CT数据处理，将吸水数据存在E盘新建的CT数据下，文件编号根据吸水时间从1开始逐步增加
% % %切割后文件夹1代表X方向，2代表Y方向，3代表Z方向
% clc
% clf
% clear all
% tic
% %% 图片读取
% B=[];
% n=0;
% N=15;%一共有多少测试了多少时间
% %% 沿竖直方向确定切割范围，删除吸水不到的地方，减小计算量
% xx1=400;xx2=600;
% yy1=400;yy2=600;
% zz1=50;zz2=350;
% %% 创建元胞数组
% NumOfExp = N;
% M = cell(1,NumOfExp);
% MB = cell(1,NumOfExp);
% %% 读取不同时间段的CT数据
% nn=0;
% for i=zz1:zz2 %读取照片数
%     n=n+1;
%     i
% for j=1:N
%    nn=1000*j+i;
%    M{j}  = imread(strcat('G:\张云升课题组CT\封闭氯化铯溶液吸水\导出自VG\',num2str(j),'\',num2str(nn),'.bmp'));%读取数据
% end
% for nn=1:N
%    MB{nn}(:,:,n)=M{nn}(xx1:xx2,yy1:yy2);% 将元胞M中第nn个子元胞二维数组赋值给元胞MB中第nn个子元胞三维数组的前两维
% end
% end
% %% 数据的输出
% for m=1:N
%     m
%     mkdir('G:\CT1\', num2str(m))%建立CT的个数
%     MMB(m)=max(max(M{m}));
%     for i=1:3
%         mkdir(strcat('G:\CT1\',num2str(m),'\'),num2str(i))%文件夹中再建三个方向的文件夹
%         if i==1
%         %% 输出X方向
%             for j = 1:length(xx1:xx2)
%                 BB =MB{m}(j,:,:);
%                 BB =rot90(squeeze(BB));
%                 imwrite(BB,strcat('G:\CT1\',num2str(m),'\',num2str(i),'\','Picture y_z',num2str(i),'_',num2str(j),'.bmp'));
%             end
%         elseif i==2
%          %% 输出Y方向
%             for j = 1:length(yy1:yy2)
%                 BB =MB{m}(:,j,:);
%                 BB =rot90(squeeze(BB),2);%降维处理和方向旋转
%                 imwrite(BB',strcat('G:\CT1\',num2str(m),'\',num2str(i),'\','Picture x_z',num2str(i),'_',num2str(j),'.bmp'));
%             end
%         else
%           %% 输出Z方向
%             for j = 1:length(zz1:zz2)
%                 BB = MB{m}(:,:,j);
%                 BB =rot90(flipud(squeeze(BB)));%降维处理和方向旋转
%                 imwrite(BB,strcat('G:\CT1\',num2str(m),'\',num2str(i),'\','Picture x_y',num2str(i),'_',num2str(j),'.bmp'));
%             end
%         end
%     end
% end
% toc %这段程序运训多长时间
% % colormap的创建
% nrgb=N;%输入输出的线条数
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
    A(:,i) = cast(MB{i}(80,40,:),'like',1);%取i时间段下坐标xy(1,1)位置处z方向的灰度值,并转化为整型
end
for i=1:N
    A(:,i)=A(:,i)+A(nnn,15)-A(nnn,i);
    plot(A(:,i)+15*50/1250*T(i),(1:301)','color',mycolor(i,:),'LineWidth',2);hold on%输出特定线的灰度值
    % 输出Gif
    F=getframe(gcf);%获取整个图窗
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    imwrite(I,map,strcat('I_t',num2str(i),'.bmp'));%输出单个三维图
    if i == 1
        imwrite(I,map,'I_t1.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'I_t1.gif','gif','WriteMode','append','DelayTime',0.2);
    end
    
end
set(gcf,'color','w')%设定背景
ylabel('height/65\mum');axis([80,920,0,300]);
set(gcf,'position',[100,100,1000,500]);set(gca,'position',[0.05,0.04,0.94,0.95]);
set(gca,'xtick',[]);
for i=1:15
     annotation(figure(1),'textbox',[0.901/1250*T(i) 0.008 0.068 0.035],'String',{strcat(num2str(T(i)),'min')},...
    'LineStyle','none', 'FitBoxToText','off');
end

% figure(1)
% for i=1:N
%     A(:,i) = cast(MB{i}(80,40,:),'like',1);%取i时间段下坐标xy(1,1)位置处z方向的灰度值,并转化为整型
% end
% figure(1)
% set(gcf,'color','w')%设定背景
% for i=13:13
%     A(:,i)=A(:,i)+A(nnn,15)-A(nnn,i);
%     plot((1:301)',A(:,i),'k-','LineWidth',1);hold on%输出特定线的灰度值
%     % 输出Gif
%     F=getframe(gcf);%获取整个图窗
%     I=frame2im(F);
%     [I,map]=rgb2ind(I,256);
%     imwrite(I,map,strcat('I_t',num2str(i),'.bmp'));%输出单个三维图    
% end
% ylabel('gray');xlabel('height/65\mum');
% axis([ 0, 300,0, 255]);
% set(gcf,'position',[360,198,560,420]);set(gca,'position',[0.088,0.1,0.89,0.88]);
% annotation(figure(1),'line',[0.631547619047619 0.0875],[0.687 0.687],'Color',[1 0 0],'LineWidth',1,'LineStyle','--');


