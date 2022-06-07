clc;clear;close all;
excel_name='./123';
write_sheet='sheet1';
data=[1:5]';
xlswrite(excel_name,data,write_sheet,'A1');
% Excel=actxserver('Excel.Application');
% Workbook=Excel.Workbooks.Add;
% Excel.Visible=1;
% Excel.ActiveWorkbook.Sheets.Item(1).Activate;
% Excel.ActiveWorkbook.Sheets.Item(1).Range('A1').Value='nihao';%A1–¥»Î÷µ