%punto fijo
disp("Programa de metodo de el punto fijo");
disp("Ingrese funcion en formato g=@(x) x.^2");
g=input("Ingrese funcion: ");
p0=input("Aproximacion inicial: ");
do
tol=input("ingrese tolerancia: ");
until(tol>0)
do
num=input("ingrese numero maximo de iteraciones: ");
until(num>0)

i=1;
while(i<=num)
p=g(p0);
aux(1,i)=p;
disp(p);
if(abs(p-p0)<tol)
disp("Solucion aproximada en iteracion numero: ");
disp(i);
break;
endif
i=i+1;
p0=p;




endwhile


