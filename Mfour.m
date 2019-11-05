s1='195256'; 
s2='СПб';
s3='Науки';
s4='49';
len=length(s1)+length(s2)+length(s3)+length(s4)

s0=[s1,' ',s2,' ',s3,' ',s4]
s=[s1,' ',s3,' ',s2,' ',s4]

s01=('один');
s02=('два');
s05=('пять');
s06=('шесть');
s09=('девять');

s1
s00=[s01,s09,s05,s02,s05,s06]

r=char(s1,s4)

f=fopen('in7.txt','wt+');
fprintf(f,'195256 СПб Науки 49\n');
fprintf(f,'4.79 2.001 9.921 3.21 0.25\n');
fprintf(f,'1.129 1.865 8.341 9.33 8.01\n');
fprintf(f,'8.136 8.401 7.133 3.12 3.44\n');
fclose(f);

f=fopen('in7.txt','rt');
str1=fgetl(f);
str2=fgetl(f);
str3=fgetl(f);
str4=fgetl(f);
fclose(f);

x=1:0.1:5;
y=sin(7*x);
hold on
plot(x,y);legend('y=sin(7x)');
axis auto


clear
close all
clc
% вычисление
tic %включить таймер
%указать папку, где сохранять рисунки и html-файл
File1NameExp='7';
PictHigh1='200'; %высота рисунка на html-странице
DirName1=['c:/' File1NameExp];
%create new folder for данных
if ~exist(DirName1)
mkdir(DirName1);
end;
cd(DirName1);
%открыть html-файл для создания отчета
FileHtml=fopen(['lab3' File1NameExp ' .htm'],'wt');
%Заголовок html-файла
fprintf(FileHtml,['<HTML>\n']);
fprintf(FileHtml,['<head>\n']);
fprintf(FileHtml,['<title>Отчет по лабораторной работе \n']);
fprintf(FileHtml,['</title>\n']);
fprintf(FileHtml,['<META HTTP-EQUIV="Content-Type"CONTENT="text/html; charset=windows">\n']);
fprintf(FileHtml,['</head>\n']);
fprintf(FileHtml,['<body>\n']);
fprintf(FileHtml,['<center><H3>ОТЧЕТ<br>по лабораторнойработе</h3></center>\n']);
% листинг программы или другая информация
n1=1;
n2=2;
fprintf(FileHtml,['<h3>Исходные данные</h3>\n']);
fprintf(FileHtml,'<br>%-5.0f%-5.0f\n',n1,n2);
% листинг программы или другая информация
% создать графическое окно
h1=figure('Name','Модельное изображение (исходное Image0)im3d');
hold on
%выполнить расчеты
x=[-2:0.01:2];
for beta=-0.5:0.1:0.5
y=exp(beta*x).*sin(x);
plot(x,y)
end
hold off
%сохранить построенные графики в файл
FileName000=[File1NameExp 'var7.jpg'];
saveas(h1,FileName000);

% полученный графический файл необходимо разместить на html-странице

%создается html-файл
fprintf(FileHtml,['<br><br> Графики \n']);
fprintf(FileHtml,['<a href="' FileName000 '">']);
fprintf(FileHtml,['<br><img src="'...
FileName000 '" height="' PictHigh1 '" >' '\n']);
%fprintf(FileHtml,['<a href="' FileName000 '">']);
fprintf(FileHtml,['</a>\n']);
fprintf(FileHtml,['</body>\n']);
fprintf(FileHtml,['</HTML>\n']);
fclose(FileHtml);
disp('Вычисления завершены');
toc %вывести показания таймера
