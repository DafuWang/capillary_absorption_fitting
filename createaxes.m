function createaxes(Parent1, X1, YMatrix1)
%CREATEAXES(Parent1, X1, YMatrix1)
%  PARENT1:  axes parent
%  X1:  x 数据的向量
%  YMATRIX1:  y 数据的矩阵

%  由 MATLAB 于 22-Oct-2020 22:15:07 自动生成

% 创建 axes
axes1 = axes('Parent',Parent1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(X1,YMatrix1,'LineWidth',2,'Parent',axes1);
set(plot1(1),'DisplayName','\theta =0.94748;ri=1e-10;rf=2e-09',...
    'Color',[0 0 0]);
set(plot1(2),'Color',[0 0 0.703296703296703]);
set(plot1(3),'Color',[0 0.177884615384615 1]);
set(plot1(4),'Color',[0 0.485576923076923 1]);
set(plot1(5),'Color',[0 0.793269230769231 1]);
set(plot1(6),'Color',[0.100961538461539 1 0.899038461538461]);
set(plot1(7),'Color',[0.408653846153846 1 0.591346153846154]);
set(plot1(8),'Color',[0.716346153846154 1 0.283653846153846]);
set(plot1(9),'DisplayName','data1','Color',[1 0.975961538461538 0]);
set(plot1(10),'Color',[1 0.668269230769231 0]);
set(plot1(11),'Color',[1 0.360576923076923 0]);
set(plot1(12),'DisplayName','data1','Color',[1 0.052884615384615 0]);
set(plot1(13),'Color',[1 0 0]);

% 创建 light
light('Parent',axes1,...
    'Position',[-0.999400539452414 4.03902919336776e-06 0.0346202502288665]);

% 创建 ylabel
ylabel('I/m');

% 创建 xlabel
xlabel('t/s');

