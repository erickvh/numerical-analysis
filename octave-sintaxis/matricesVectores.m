a=[1,2,3,4,5; 6,7,8 ,9,10];
a
size(a)
columns(a)
disp("comportamiento como vector");
% manejado como un vector internamenten respeta de cada columna
a(1) %1
a(6) %8
a(10) %10

a(:,2)=[]; %borrando fila 
a(1,:)=[]; %borrando columnas

